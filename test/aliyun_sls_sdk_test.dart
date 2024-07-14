import 'package:aliyun_sdk/sls/aliyun_sls.dart';
import 'package:aliyun_sdk/sls/models/aliyun_sls_options.dart';
import 'package:aliyun_sdk/sls/models/generated/aliyun_sls.pb.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Aliyun SLS putLog', () async {
    const client = AliyunSLS(AliyunSLSOptions(
        endpoint: 'cn-shenzhen.log.aliyuncs.com',
        store: 'test',
        project: 'test',
        accessKeyId: '',
        accessKeySecret: ''));
    final res = await client.putLogs([
      Log(
        time: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        contents: [Log_Content(key: 'test', value: 'test')],
      )
    ]);
    expect(res.statusCode, 200);
  });
}
