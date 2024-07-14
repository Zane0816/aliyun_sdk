//
//  Generated code. Do not modify.
//  source: aliyun_sls.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use logDescriptor instead')
const Log$json = {
  '1': 'Log',
  '2': [
    {'1': 'Time', '3': 1, '4': 2, '5': 13, '10': 'Time'},
    {'1': 'Contents', '3': 2, '4': 3, '5': 11, '6': '.Log.Content', '10': 'Contents'},
    {'1': 'Time_ns', '3': 4, '4': 1, '5': 7, '10': 'TimeNs'},
  ],
  '3': [Log_Content$json],
};

@$core.Deprecated('Use logDescriptor instead')
const Log_Content$json = {
  '1': 'Content',
  '2': [
    {'1': 'Key', '3': 1, '4': 2, '5': 9, '10': 'Key'},
    {'1': 'Value', '3': 2, '4': 2, '5': 9, '10': 'Value'},
  ],
};

/// Descriptor for `Log`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logDescriptor = $convert.base64Decode(
    'CgNMb2cSEgoEVGltZRgBIAIoDVIEVGltZRIoCghDb250ZW50cxgCIAMoCzIMLkxvZy5Db250ZW'
    '50UghDb250ZW50cxIXCgdUaW1lX25zGAQgASgHUgZUaW1lTnMaMQoHQ29udGVudBIQCgNLZXkY'
    'ASACKAlSA0tleRIUCgVWYWx1ZRgCIAIoCVIFVmFsdWU=');

@$core.Deprecated('Use logTagDescriptor instead')
const LogTag$json = {
  '1': 'LogTag',
  '2': [
    {'1': 'Key', '3': 1, '4': 2, '5': 9, '10': 'Key'},
    {'1': 'Value', '3': 2, '4': 2, '5': 9, '10': 'Value'},
  ],
};

/// Descriptor for `LogTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logTagDescriptor = $convert.base64Decode(
    'CgZMb2dUYWcSEAoDS2V5GAEgAigJUgNLZXkSFAoFVmFsdWUYAiACKAlSBVZhbHVl');

@$core.Deprecated('Use logGroupDescriptor instead')
const LogGroup$json = {
  '1': 'LogGroup',
  '2': [
    {'1': 'Logs', '3': 1, '4': 3, '5': 11, '6': '.Log', '10': 'Logs'},
    {'1': 'Reserved', '3': 2, '4': 1, '5': 9, '10': 'Reserved'},
    {'1': 'Topic', '3': 3, '4': 1, '5': 9, '10': 'Topic'},
    {'1': 'Source', '3': 4, '4': 1, '5': 9, '10': 'Source'},
    {'1': 'LogTags', '3': 6, '4': 3, '5': 11, '6': '.LogTag', '10': 'LogTags'},
  ],
};

/// Descriptor for `LogGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logGroupDescriptor = $convert.base64Decode(
    'CghMb2dHcm91cBIYCgRMb2dzGAEgAygLMgQuTG9nUgRMb2dzEhoKCFJlc2VydmVkGAIgASgJUg'
    'hSZXNlcnZlZBIUCgVUb3BpYxgDIAEoCVIFVG9waWMSFgoGU291cmNlGAQgASgJUgZTb3VyY2US'
    'IQoHTG9nVGFncxgGIAMoCzIHLkxvZ1RhZ1IHTG9nVGFncw==');

@$core.Deprecated('Use logGroupListDescriptor instead')
const LogGroupList$json = {
  '1': 'LogGroupList',
  '2': [
    {'1': 'logGroupList', '3': 1, '4': 3, '5': 11, '6': '.LogGroup', '10': 'logGroupList'},
  ],
};

/// Descriptor for `LogGroupList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logGroupListDescriptor = $convert.base64Decode(
    'CgxMb2dHcm91cExpc3QSLQoMbG9nR3JvdXBMaXN0GAEgAygLMgkuTG9nR3JvdXBSDGxvZ0dyb3'
    'VwTGlzdA==');

