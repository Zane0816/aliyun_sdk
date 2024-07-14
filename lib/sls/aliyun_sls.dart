import 'dart:io';

import 'package:dio/dio.dart';

import 'package:aliyun_sdk/sls/models/aliyun_sls_options.dart';
import 'package:aliyun_sdk/sls/models/generated/aliyun_sls.pb.dart';
import 'package:aliyun_sdk/utils/encrypt.dart';

class AliyunSLS {
  final AliyunSLSOptions _options;

  const AliyunSLS(AliyunSLSOptions options) : _options = options;

  /// sign the header information
  String _getHeaderString(
    Map<String, dynamic> headers,
  ) {
    final List<String> ossHeaders = headers.keys
        .where((key) => key.toLowerCase().startsWith('x-log-'))
        .toList();
    if (ossHeaders.isEmpty) return '';
    ossHeaders.sort((s1, s2) => s1.compareTo(s2));

    return ossHeaders.map((key) => "$key:${headers[key]}").join("\n");
  }

  /// sign the resource part information
  String _getResourceString(
    String path,
    Map<String, dynamic> param,
  ) {
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
    final String date = headers['Date'] ?? '';
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

  Map<String, dynamic> _sign(
    Map<String, dynamic> headers,
    String method,
    String path,
    Map<String, dynamic> param,
  ) {
    final String signature = _makeSignature(headers, method, path, param);
    return {
      ...headers,
      'Authorization': "LOG ${_options.accessKeyId}:$signature",
    };
  }

  /// 推送日志
  Future<Response<dynamic>> putLogs(
    List<Log> logs, {
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
  }) async {
    final path = '/logstores/${_options.store}/shards/lb';
    final String url = "https://${_options.project}.${_options.endpoint}$path";
    final body = LogGroup(logs: logs).writeToBuffer();
    final res = await Dio().post(
      url,
      data: body,
      cancelToken: cancelToken,
      options: Options(
          headers: _sign(
              {
                'content-type': "application/x-protobuf",
                'Date': HttpDate.format(DateTime.now()),
                'x-log-bodyrawsize': body.length.toString(),
                'x-log-apiversion': '0.6.0',
                'x-log-signaturemethod': 'hmac-sha1',
                'x-log-security-token': _options.securityToken,
                'content-md5': EncryptUtil.md5FromBytes(body),
                ...?headers,
              },
              'POST',
              path,
              {})),
    );
    return res;
  }
}
