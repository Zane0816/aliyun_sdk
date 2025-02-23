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
  /// [topic] 主题
  Future<Response<dynamic>> putLog(
    Map<String, dynamic> log, {
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    String? topic,
  }) async {
    final path = '/logstores/${_options.store}/shards/lb';
    final String url = "https://${_options.project}.${_options.endpoint}$path";
    final now = DateTime.now();
    final body = LogGroup(
      topic: topic,
      logs: [
        Log(
          time: now.millisecondsSinceEpoch ~/ 1000,
          contents: log.entries.toList().map((e) {
            return Log_Content(
                key: e.key,
                value: e.value is String ? e.value : jsonEncode(e.value));
          }).toList(),
        )
      ],
    ).writeToBuffer();
    final contentMd5 = EncryptUtil.md5Hex(body);
    const contentType = 'application/x-protobuf';
    final date = HttpDate.format(now);
    final aliYunHeaders = {
      'x-log-bodyrawsize': body.length.toString(),
      'x-log-apiversion': '0.6.0',
      'x-log-signaturemethod': 'hmac-sha1',
      'x-acs-security-token': _options.securityToken,
    };
    final signature = EncryptUtil.signature(
        accessKeySecret: _options.accessKeySecret,
        method: 'POST',
        contentMD5: contentMd5,
        contentType: contentType,
        date: date,
        headers: aliYunHeaders,
        resource: path);
    final $headers = {
      ...aliYunHeaders,
      'content-type': contentType,
      'content-length': body.length,
      'Date': date,
      'content-md5': contentMd5,
      'Authorization': "LOG ${_options.accessKeyId}:$signature",
      ...?headers,
    }..removeWhere((k, v) => v == null);
    return Dio().post(
      url,
      data: body,
      cancelToken: cancelToken,
      options: Options(headers: $headers),
    );
  }
}
