//
//  Generated code. Do not modify.
//  source: aliyun_sls.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Log_Content extends $pb.GeneratedMessage {
  factory Log_Content({
    $core.String? key,
    $core.String? value,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  Log_Content._() : super();
  factory Log_Content.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Log_Content.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Log.Content', createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'Key', protoName: 'Key')
    ..aQS(2, _omitFieldNames ? '' : 'Value', protoName: 'Value')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Log_Content clone() => Log_Content()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Log_Content copyWith(void Function(Log_Content) updates) => super.copyWith((message) => updates(message as Log_Content)) as Log_Content;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Log_Content create() => Log_Content._();
  Log_Content createEmptyInstance() => create();
  static $pb.PbList<Log_Content> createRepeated() => $pb.PbList<Log_Content>();
  @$core.pragma('dart2js:noInline')
  static Log_Content getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Log_Content>(create);
  static Log_Content? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class Log extends $pb.GeneratedMessage {
  factory Log({
    $core.int? time,
    $core.Iterable<Log_Content>? contents,
    $core.int? timeNs,
  }) {
    final $result = create();
    if (time != null) {
      $result.time = time;
    }
    if (contents != null) {
      $result.contents.addAll(contents);
    }
    if (timeNs != null) {
      $result.timeNs = timeNs;
    }
    return $result;
  }
  Log._() : super();
  factory Log.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Log.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Log', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'Time', $pb.PbFieldType.QU3, protoName: 'Time')
    ..pc<Log_Content>(2, _omitFieldNames ? '' : 'Contents', $pb.PbFieldType.PM, protoName: 'Contents', subBuilder: Log_Content.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'TimeNs', $pb.PbFieldType.OF3, protoName: 'Time_ns')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Log clone() => Log()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Log copyWith(void Function(Log) updates) => super.copyWith((message) => updates(message as Log)) as Log;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Log create() => Log._();
  Log createEmptyInstance() => create();
  static $pb.PbList<Log> createRepeated() => $pb.PbList<Log>();
  @$core.pragma('dart2js:noInline')
  static Log getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Log>(create);
  static Log? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get time => $_getIZ(0);
  @$pb.TagNumber(1)
  set time($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Log_Content> get contents => $_getList(1);

  @$pb.TagNumber(4)
  $core.int get timeNs => $_getIZ(2);
  @$pb.TagNumber(4)
  set timeNs($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimeNs() => $_has(2);
  @$pb.TagNumber(4)
  void clearTimeNs() => clearField(4);
}

class LogTag extends $pb.GeneratedMessage {
  factory LogTag({
    $core.String? key,
    $core.String? value,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  LogTag._() : super();
  factory LogTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogTag', createEmptyInstance: create)
    ..aQS(1, _omitFieldNames ? '' : 'Key', protoName: 'Key')
    ..aQS(2, _omitFieldNames ? '' : 'Value', protoName: 'Value')
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogTag clone() => LogTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogTag copyWith(void Function(LogTag) updates) => super.copyWith((message) => updates(message as LogTag)) as LogTag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogTag create() => LogTag._();
  LogTag createEmptyInstance() => create();
  static $pb.PbList<LogTag> createRepeated() => $pb.PbList<LogTag>();
  @$core.pragma('dart2js:noInline')
  static LogTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogTag>(create);
  static LogTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class LogGroup extends $pb.GeneratedMessage {
  factory LogGroup({
    $core.Iterable<Log>? logs,
    $core.String? reserved,
    $core.String? topic,
    $core.String? source,
    $core.Iterable<LogTag>? logTags,
  }) {
    final $result = create();
    if (logs != null) {
      $result.logs.addAll(logs);
    }
    if (reserved != null) {
      $result.reserved = reserved;
    }
    if (topic != null) {
      $result.topic = topic;
    }
    if (source != null) {
      $result.source = source;
    }
    if (logTags != null) {
      $result.logTags.addAll(logTags);
    }
    return $result;
  }
  LogGroup._() : super();
  factory LogGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogGroup', createEmptyInstance: create)
    ..pc<Log>(1, _omitFieldNames ? '' : 'Logs', $pb.PbFieldType.PM, protoName: 'Logs', subBuilder: Log.create)
    ..aOS(2, _omitFieldNames ? '' : 'Reserved', protoName: 'Reserved')
    ..aOS(3, _omitFieldNames ? '' : 'Topic', protoName: 'Topic')
    ..aOS(4, _omitFieldNames ? '' : 'Source', protoName: 'Source')
    ..pc<LogTag>(6, _omitFieldNames ? '' : 'LogTags', $pb.PbFieldType.PM, protoName: 'LogTags', subBuilder: LogTag.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogGroup clone() => LogGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogGroup copyWith(void Function(LogGroup) updates) => super.copyWith((message) => updates(message as LogGroup)) as LogGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogGroup create() => LogGroup._();
  LogGroup createEmptyInstance() => create();
  static $pb.PbList<LogGroup> createRepeated() => $pb.PbList<LogGroup>();
  @$core.pragma('dart2js:noInline')
  static LogGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogGroup>(create);
  static LogGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Log> get logs => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get reserved => $_getSZ(1);
  @$pb.TagNumber(2)
  set reserved($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReserved() => $_has(1);
  @$pb.TagNumber(2)
  void clearReserved() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get topic => $_getSZ(2);
  @$pb.TagNumber(3)
  set topic($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTopic() => $_has(2);
  @$pb.TagNumber(3)
  void clearTopic() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get source => $_getSZ(3);
  @$pb.TagNumber(4)
  set source($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSource() => $_has(3);
  @$pb.TagNumber(4)
  void clearSource() => clearField(4);

  @$pb.TagNumber(6)
  $core.List<LogTag> get logTags => $_getList(4);
}

class LogGroupList extends $pb.GeneratedMessage {
  factory LogGroupList({
    $core.Iterable<LogGroup>? logGroupList,
  }) {
    final $result = create();
    if (logGroupList != null) {
      $result.logGroupList.addAll(logGroupList);
    }
    return $result;
  }
  LogGroupList._() : super();
  factory LogGroupList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogGroupList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogGroupList', createEmptyInstance: create)
    ..pc<LogGroup>(1, _omitFieldNames ? '' : 'logGroupList', $pb.PbFieldType.PM, protoName: 'logGroupList', subBuilder: LogGroup.create)
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogGroupList clone() => LogGroupList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogGroupList copyWith(void Function(LogGroupList) updates) => super.copyWith((message) => updates(message as LogGroupList)) as LogGroupList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogGroupList create() => LogGroupList._();
  LogGroupList createEmptyInstance() => create();
  static $pb.PbList<LogGroupList> createRepeated() => $pb.PbList<LogGroupList>();
  @$core.pragma('dart2js:noInline')
  static LogGroupList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogGroupList>(create);
  static LogGroupList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<LogGroup> get logGroupList => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
