class AliyunSLSOptions {
  final String endpoint;
  final String store;
  final String project;
  final String accessKeyId;
  final String accessKeySecret;
  final String? securityToken;

  const AliyunSLSOptions({
    required this.endpoint,
    required this.store,
    required this.project,
    required this.accessKeyId,
    required this.accessKeySecret,
    this.securityToken,
  });
}
