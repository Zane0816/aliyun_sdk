import 'package:aliyun_sdk/aliyun_sdk.dart';
import 'package:aliyun_sdk/oss/models/aliyun_oss_options.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Aliyun OSS putLog', () async {
    const client = AliyunOSS(AliyunOSSOptions(
        endpoint: 'cn-hangzhou.oss.aliyuncs.com',
        accessKeyId: '',
        accessKeySecret: '',
        bucket: 'test'));
    final bytes = "file test bytes ".codeUnits;
    final res = await client.putObject(bytes, 'test.txt');
    expect(res.statusCode, 200);
  });
}
