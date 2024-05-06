// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.33.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<void> sendNotify(
        {String? summary,
        String? body,
        String? appName,
        String? appId,
        dynamic hint}) =>
    RustLib.instance.api.sendNotify(
        summary: summary,
        body: body,
        appName: appName,
        appId: appId,
        hint: hint);

Future<bool> setForegroundWindow({required String windowName, dynamic hint}) =>
    RustLib.instance.api
        .setForegroundWindow(windowName: windowName, hint: hint);
