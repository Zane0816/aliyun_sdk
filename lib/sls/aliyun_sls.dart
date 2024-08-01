import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:aliyun_sdk/sls/models/aliyun_sls_options.dart';
import 'package:aliyun_sdk/sls/models/generated/aliyun_sls.pb.dart';
import 'package:aliyun_sdk/utils/encrypt.dart';

class AliyunSLS {
  final AliyunSLSOptions _options;

  const AliyunSLS(AliyunSLSOptions options) : _options = options;

  /// 推送日志
  Future<Response<dynamic>> putLog(
    Map<String, dynamic> log, {
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
  }) async {
    final uri = Uri.https('${_options.project}.${_options.endpoint}',
        '/logstores/${_options.store}/shards/lb');
    final body = LogGroup(logs: [
      Log(
          time: DateTime.now().millisecondsSinceEpoch ~/ 1000,
          contents: log.entries.map((e) {
            return Log_Content(
              key: e.key,
              value: jsonEncode(e.value),
            );
          }).toList())
    ]).writeToBuffer();
    final contentMD5 = EncryptUtil.md5FromBytes(body);
    const contentType = 'application/x-protobuf';
    final date = HttpDate.format(DateTime.now());
    final aliyunHeaders = {
      'x-log-bodyrawsize': body.length.toString(),
      'x-log-apiversion': '0.6.0',
      'x-log-signaturemethod': 'hmac-sha1',
      'x-acs-security-token': _options.securityToken,
    };
    final resource =
        '${uri.path}${uri.query.isNotEmpty ? '?' : ''}${uri.query}';
    final signature = EncryptUtil.signature(
      accessKeySecret: _options.accessKeySecret,
      method: 'POST',
      contentMD5: contentMD5,
      contentType: contentType,
      date: date,
      headers: aliyunHeaders,
      resource: resource,
    );
    final $headers = {
      'content-type': contentType,
      'Date': date,
      'content-md5': contentMD5,
      'Authorization': "LOG ${_options.accessKeyId}:$signature",
      ...aliyunHeaders,
      ...?headers,
    }..removeWhere((k, v) => v == null);
    final res = await Dio().postUri(
      uri,
      data: body,
      cancelToken: cancelToken,
      options: Options(headers: $headers),
    );
    return res;
  }
}
