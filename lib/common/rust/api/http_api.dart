// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.31.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import '../http_package.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<void> setDefaultHeader(
        {required Map<String, String> headers, dynamic hint}) =>
    RustLib.instance.api.setDefaultHeader(headers: headers, hint: hint);

Future<RustHttpResponse> fetch(
        {required MyMethod method,
        required String url,
        Map<String, String>? headers,
        Uint8List? inputData,
        String? withIpAddress,
        dynamic hint}) =>
    RustLib.instance.api.fetch(
        method: method,
        url: url,
        headers: headers,
        inputData: inputData,
        withIpAddress: withIpAddress,
        hint: hint);

Future<List<String>> dnsLookupTxt({required String host, dynamic hint}) =>
    RustLib.instance.api.dnsLookupTxt(host: host, hint: hint);

Future<List<String>> dnsLookupIps({required String host, dynamic hint}) =>
    RustLib.instance.api.dnsLookupIps(host: host, hint: hint);

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
}
