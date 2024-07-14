class AliyunOSSOptions {
  final String endpoint;
  final String bucket;
  final String accessKeyId;
  final String accessKeySecret;
  final String? securityToken;

  const AliyunOSSOptions({
    required this.endpoint,
    required this.bucket,
    required this.accessKeyId,
    required this.accessKeySecret,
    this.securityToken,
  });
}
