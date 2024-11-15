// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.6.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import '../http_package.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These functions are ignored because they are not marked as `pub`: `_my_method_to_hyper_method`

Future<void> setDefaultHeader({required Map<String, String> headers}) =>
    RustLib.instance.api.crateApiHttpApiSetDefaultHeader(headers: headers);

Future<RustHttpResponse> fetch(
        {required MyMethod method,
        required String url,
        Map<String, String>? headers,
        Uint8List? inputData,
        String? withIpAddress,
        bool? withCustomDns}) =>
    RustLib.instance.api.crateApiHttpApiFetch(
        method: method,
        url: url,
        headers: headers,
        inputData: inputData,
        withIpAddress: withIpAddress,
        withCustomDns: withCustomDns);

Future<List<String>> dnsLookupTxt({required String host}) =>
    RustLib.instance.api.crateApiHttpApiDnsLookupTxt(host: host);

Future<List<String>> dnsLookupIps({required String host}) =>
    RustLib.instance.api.crateApiHttpApiDnsLookupIps(host: host);

enum MyMethod {
  options,
  gets,
  post,
  put,
  delete,
  head,
  trace,
  connect,
  patch,
  ;
}
