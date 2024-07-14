import 'dart:io';
import 'dart:typed_data';

import 'package:aliyun_sdk/oss/models/aliyun_oss_options.dart';
import 'package:aliyun_sdk/oss/models/index.dart';
import 'package:aliyun_sdk/utils/encrypt.dart';
import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

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

  /// sign the header information
  String _getHeaderString(
    Map<String, dynamic> headers,
  ) {
    final List<String> ossHeaders = headers.keys
        .where((key) => key.toLowerCase().startsWith('x-oss-'))
        .toList();
    if (ossHeaders.isEmpty) return '';
    ossHeaders.sort((s1, s2) => s1.compareTo(s2));

    return ossHeaders.map((key) => "$key:${headers[key]}").join("\n");
  }

  /// sign the resource part information
  String _getResourceString(
    String fileKey,
    Map<String, dynamic> param,
  ) {
    String path = "/";
    if (_options.bucket.isNotEmpty) path += "${_options.bucket}/";
    if (fileKey.isNotEmpty) path += fileKey;
    final String signedParamString =
        param.keys.map((item) => "$item=${param[item]}").join("&");
    if (signedParamString.isNotEmpty) {
      path += "?$signedParamString";
    }

    return path;
  }

  /// sign the string use hmac
  String _makeSignature(Map<String, dynamic> headers, String method, String key,
      Map<String, dynamic> param) {
    final String contentMd5 = headers['content-md5'] ?? '';
    final String contentType = headers['content-type'] ?? '';
    final String date = headers['x-oss-date'] ?? '';
    final String headerString = _getHeaderString(headers);
    final String resourceString = _getResourceString(key, param);
    final String stringToSign = [
      method,
      contentMd5,
      contentType,
      date,
      headerString,
      resourceString
    ].join("\n");

    return EncryptUtil.hmacSign(_options.accessKeySecret, stringToSign);
  }

  Map<String, dynamic> _sign(Map<String, dynamic> headers, String method,
      String key, Map<String, dynamic> param) {
    final String signature = _makeSignature(headers, method, key, param);
    return {
      ...headers,
      'Authorization': "OSS ${_options.accessKeyId}:$signature",
    };
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
    final String bucket = _options.bucket;

    final MultipartFile multipartFile = MultipartFile.fromBytes(
      fileData,
      filename: fileKey,
    );

    final String url = "https://$bucket.${_options.endpoint}/$fileKey";
    final _headers = {
      'content-type': lookupMimeType(fileKey) ?? "application/octet-stream",
      'content-length': multipartFile.length,
      'x-oss-forbid-overwrite': override,
      'x-oss-object-acl': acl?.content,
      'x-oss-storage-class': storage?.content,
      'x-oss-date': HttpDate.format(DateTime.now()),
      'x-oss-security-token': _options.securityToken,
      ...?headers,
    }..removeWhere((k, v) => v == null);
    return Dio().put(
      url,
      data: _chunkFile(multipartFile),
      cancelToken: cancelToken,
      options: Options(headers: _sign(_headers, 'PUT', fileKey, {})),
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
