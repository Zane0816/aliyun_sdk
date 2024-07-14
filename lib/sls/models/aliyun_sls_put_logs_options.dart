class AliyunSLSLogContent {
  final String key;
  final String value;

  const AliyunSLSLogContent({
    required this.key,
    required this.value,
  });
}
class AliyunSLSLog {
  ///时间
  final DateTime time;
  final List<AliyunSLSLogContent> contents;

  const AliyunSLSLog({
    required this.time,
    required this.contents,
  });
}

class AliyunSLSLogGroup {
  ///来源
  final String source;

  ///主题
  final String topic;
  final List<AliyunSLSLog> logs;

  const AliyunSLSLogGroup({
    required this.source,
    required this.topic,
    required this.logs,
  });
}

class AliyunSLSPutLogsOptions {
  ///project名称
  final String projectName;

  ///logStore名称
  final String logStoreName;

  ///写入的日志
  final AliyunSLSLogGroup logGroup;

  const AliyunSLSPutLogsOptions({
    required this.projectName,
    required this.logStoreName,
    required this.logGroup,
  });
}
