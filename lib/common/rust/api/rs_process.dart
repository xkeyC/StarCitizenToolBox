// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.6.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These functions are ignored because they are not marked as `pub`: `_process_output`
// These types are ignored because they are not used by any `pub` functions: `RsProcess`
// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `clone`

Stream<RsProcessStreamData> start(
        {required String executable,
        required List<String> arguments,
        required String workingDirectory}) =>
    RustLib.instance.api.crateApiRsProcessStart(
        executable: executable,
        arguments: arguments,
        workingDirectory: workingDirectory);

Future<void> write({required int rsPid, required String data}) =>
    RustLib.instance.api.crateApiRsProcessWrite(rsPid: rsPid, data: data);

class RsProcessStreamData {
  final RsProcessStreamDataType dataType;
  final String data;
  final int rsPid;

  const RsProcessStreamData({
    required this.dataType,
    required this.data,
    required this.rsPid,
  });

  @override
  int get hashCode => dataType.hashCode ^ data.hashCode ^ rsPid.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RsProcessStreamData &&
          runtimeType == other.runtimeType &&
          dataType == other.dataType &&
          data == other.data &&
          rsPid == other.rsPid;
}

enum RsProcessStreamDataType {
  output,
  error,
  exit,
  ;
}
