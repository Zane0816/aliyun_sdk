import 'dart:io';

class HeaderUtils {
  static Map<String, dynamic> buildHeader(
    String contentType,
    Map<String, dynamic> aliyunHeaders,
    Map<String, dynamic> headers,
  ) {
    return {
      'content-type': contentType,
      'Date': HttpDate.format(DateTime.now()),
    };
  }
}
