阿里云SDK Dart实现

# 特性

- 支持 OSS的 签名、上传文件
- 支持 SLS的 签名、上传日志

# 使用

## OSS上传文件

```dart
import 'package:aliyun_sdk/aliyun_sdk.dart';
import 'package:aliyun_sdk/oss/models/aliyun_oss_options.dart';

void main() async {
  const client = AliyunOSS(AliyunOSSOptions(
    endpoint: 'cn-hangzhou.oss.aliyuncs.com',
    accessKeyId: 'your accessKeyId',
    accessKeySecret: 'your accessKeySecret',
    bucket: 'test',
    securityToken: 'your securityToken',));
  final bytes = "file test bytes ".codeUnits;
  final res = await client.putObject(bytes, 'test.txt');
}
```

## SLS上传日志

```dart
import 'package:aliyun_sdk/sls/aliyun_sls.dart';
import 'package:aliyun_sdk/sls/models/aliyun_sls_options.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  const client = AliyunSLS(AliyunSLSOptions(
    endpoint: 'cn-shenzhen.log.aliyuncs.com',
    store: 'test',
    project: 'test',
    accessKeyId: 'your accessKeyId',
    accessKeySecret: 'your accessKeySecret',
    securityToken: 'your securityToken',));
  final res = await client.putLog({'test': 'test'});
}

```