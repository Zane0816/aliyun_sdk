import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

import 'package:aliyun_sdk/oss/models/aliyun_oss_options.dart';
import 'package:aliyun_sdk/oss/models/index.dart';
import 'package:aliyun_sdk/utils/encrypt.dart';

class AliyunOSS {
  final AliyunOSSOptions _options;

  const AliyunOSS(AliyunOSSOptions options) : _options = options;

  Stream<List<int>> _chunkFile(MultipartFile multipartFile) async* {
    final ChunkedStreamReader<int> reader =
        ChunkedStreamReader<int>(multipartFile.finalize());
    while (true) {
      final Uint8List data = await reader.readBytes(64 * 1024);
      if (data.isEmpty) {
        break;
      }
      yield data;
    }
  }

  String _canonicalizedResource(Uri uri) {
    return Uri.decodeFull(
        '/${_options.bucket}${uri.path}${uri.query.isNotEmpty ? '?' : ''}${uri.query}');
  }

  Future<Response<dynamic>> putObject(
    List<int> fileData,
    String fileKey, {
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool? override,
    AclMode? acl,
    StorageType? storage,
    Map<String, dynamic>? headers,
  }) async {
    final MultipartFile multipartFile = MultipartFile.fromBytes(
      fileData,
      filename: fileKey,
    );

    final uri =
        Uri.parse("https://${_options.bucket}.${_options.endpoint}/$fileKey");
    final contentType = lookupMimeType(fileKey) ?? "application/octet-stream";
    final date = HttpDate.format(DateTime.now());
    // final contentMd5 = EncryptUtil.md5Base64(fileData);
    final aliYunHeaders = {
      'x-oss-forbid-overwrite': override,
      'x-oss-object-acl': acl?.content,
      'x-oss-storage-class': storage?.content,
      'x-oss-date': date,
      'x-oss-security-token': _options.securityToken,
    }..removeWhere((k, v) => v == null);
    final signature = EncryptUtil.signature(
        accessKeySecret: _options.accessKeySecret,
        method: 'PUT',
        contentType: contentType,
        // contentMd5: contentMd5,
        date: date,
        headers: aliYunHeaders,
        resource: _canonicalizedResource(uri));
    final $headers = {
      ...aliYunHeaders,
      'content-type': contentType,
      'content-length': multipartFile.length,
      // 'content-md5': contentMd5,
      'Date': date,
      'Authorization': "OSS ${_options.accessKeyId}:$signature",
      ...?headers,
    }..removeWhere((k, v) => v == null);
    return Dio().putUri(
      uri,
      data: _chunkFile(multipartFile),
      cancelToken: cancelToken,
      options: Options(headers: $headers),
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
