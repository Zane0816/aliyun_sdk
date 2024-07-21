import 'package:flutter_test/flutter_test.dart';

void main() {
  test('uri 转换', () {
    var uri = Uri.parse('https://www.baidu.com/test?a=1&b=2');
    uri = uri.replace(queryParameters: {
      ...uri.queryParameters,
      ...{'test': 'test2'}
    });
    expect(uri.path, '/test');
    expect(uri.query, 'a=1&b=2&test=test2');
  });
}
