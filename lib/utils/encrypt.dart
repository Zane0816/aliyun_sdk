import 'dart:convert';

import 'package:crypto/crypto.dart';

class EncryptUtil {
  static String hmacSign(String secret, String payload) {
    final Hmac hmac = Hmac(sha1, utf8.encode(secret));
    final Digest digest = hmac.convert(utf8.encode(payload));
    return base64.encode(digest.bytes);
  }

  /// use md5 to encrypt the bytes content
  static String md5FromBytes(List<int> bytes) {
    final Digest digest = md5.convert(bytes);
    return digest.bytes.toString().toUpperCase();
  }

  /// 生成阿里云专有请求头字符串
  static String _getHeaderString(Map<String, dynamic> headers) {
    final List<String> keys = headers.keys.toList();
    if (keys.isEmpty) return '';
    keys.sort((s1, s2) => s1.compareTo(s2));
    return keys.map((key) => "$key:${headers[key]}").join("\n");
  }

  /// 签名
  /// [accessKeySecret] 秘钥
  /// [method] HTTP请求方法，全大写英文。取值包括GET、POST、PUT和DELETE
  /// [contentMD5] HTTP请求消息Body的MD5哈希值，转换为十六进制大写英文字符串。若Body为空，此项为空字符串
  /// [contentType] HTTP请求消息Body的MIME类型，若Body为空，此项为空字符串
  /// [date] HTTP请求消息头中Date字段的值，当前时间的格式化字符串。格式为RFC822/RFC1123，格式化字符串为%a, %d %b %Y %H:%M:%S GMT，时区为GMT标准时间。
  /// [headers] header中阿里云专有请求头，按 key升序排序后，以 : 连接键值，以换行符分隔键值对。
  /// [resource] HTTP请求消息URI，包含请求参数，格式为/bucket/object?param1=value1&param2=value2
  static String signature(
    String accessKeySecret,
    String method,
    String contentMD5,
    String contentType,
    String date,
    Map<String, dynamic> headers,
    String resource,
  ) {
    final headerString = _getHeaderString(headers);
    final String singContent = [
      method,
      contentMD5,
      contentType,
      date,
      headerString,
      resource
    ].join("\n");
    return EncryptUtil.hmacSign(accessKeySecret, singContent);
  }
}
