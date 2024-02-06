// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.23.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/downloader_api.dart';
import 'dart:async';
import 'dart:convert';
import 'downloader.dart';
import 'frb_generated.io.dart' if (dart.library.html) 'frb_generated.web.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {}

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  @override
  String get codegenVersion => '2.0.0-dev.23';

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: 'rust',
    ioDirectory: 'rust/target/release/',
    webPrefix: 'pkg/',
  );
}

abstract class RustLibApi extends BaseApi {
  Future<void> cancelDownload({required String id, dynamic hint});

  Stream<DownloadCallbackData> startDownload(
      {required String url,
      required String savePath,
      required String fileName,
      required int connectionCount,
      dynamic hint});
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  Future<void> cancelDownload({required String id, dynamic hint}) {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(id, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 2, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCancelDownloadConstMeta,
      argValues: [id],
      apiImpl: this,
      hint: hint,
    ));
  }

  TaskConstMeta get kCancelDownloadConstMeta => const TaskConstMeta(
        debugName: "cancel_download",
        argNames: ["id"],
      );

  @override
  Stream<DownloadCallbackData> startDownload(
      {required String url,
      required String savePath,
      required String fileName,
      required int connectionCount,
      dynamic hint}) {
    return handler.executeStream(StreamTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_String(url, serializer);
        sse_encode_String(savePath, serializer);
        sse_encode_String(fileName, serializer);
        sse_encode_u_8(connectionCount, serializer);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 1, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_download_callback_data,
        decodeErrorData: null,
      ),
      constMeta: kStartDownloadConstMeta,
      argValues: [url, savePath, fileName, connectionCount],
      apiImpl: this,
      hint: hint,
    ));
  }

  TaskConstMeta get kStartDownloadConstMeta => const TaskConstMeta(
        debugName: "start_download",
        argNames: ["url", "savePath", "fileName", "connectionCount"],
      );

  @protected
  String dco_decode_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as String;
  }

  @protected
  DownloadCallbackData dco_decode_download_callback_data(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 5)
      throw Exception('unexpected arr length: expect 5 but see ${arr.length}');
    return DownloadCallbackData(
      id: dco_decode_String(arr[0]),
      total: dco_decode_u_64(arr[1]),
      progress: dco_decode_u_64(arr[2]),
      speed: dco_decode_u_64(arr[3]),
      status: dco_decode_my_downloader_status(arr[4]),
    );
  }

  @protected
  int dco_decode_i_32(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as Uint8List;
  }

  @protected
  MyDownloaderStatus dco_decode_my_downloader_status(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    switch (raw[0]) {
      case 0:
        return MyDownloaderStatus_NoStart();
      case 1:
        return MyDownloaderStatus_Running();
      case 2:
        return MyDownloaderStatus_Pending(
          dco_decode_my_network_item_pending_type(raw[1]),
        );
      case 3:
        return MyDownloaderStatus_Error(
          dco_decode_String(raw[1]),
        );
      case 4:
        return MyDownloaderStatus_Finished();
      default:
        throw Exception("unreachable");
    }
  }

  @protected
  MyNetworkItemPendingType dco_decode_my_network_item_pending_type(
      dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return MyNetworkItemPendingType.values[raw as int];
  }

  @protected
  int dco_decode_u_64(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dcoDecodeI64OrU64(raw);
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  void dco_decode_unit(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return;
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  DownloadCallbackData sse_decode_download_callback_data(
      SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_id = sse_decode_String(deserializer);
    var var_total = sse_decode_u_64(deserializer);
    var var_progress = sse_decode_u_64(deserializer);
    var var_speed = sse_decode_u_64(deserializer);
    var var_status = sse_decode_my_downloader_status(deserializer);
    return DownloadCallbackData(
        id: var_id,
        total: var_total,
        progress: var_progress,
        speed: var_speed,
        status: var_status);
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getInt32();
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  MyDownloaderStatus sse_decode_my_downloader_status(
      SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var tag_ = sse_decode_i_32(deserializer);
    switch (tag_) {
      case 0:
        return MyDownloaderStatus_NoStart();
      case 1:
        return MyDownloaderStatus_Running();
      case 2:
        var var_field0 = sse_decode_my_network_item_pending_type(deserializer);
        return MyDownloaderStatus_Pending(var_field0);
      case 3:
        var var_field0 = sse_decode_String(deserializer);
        return MyDownloaderStatus_Error(var_field0);
      case 4:
        return MyDownloaderStatus_Finished();
      default:
        throw UnimplementedError('');
    }
  }

  @protected
  MyNetworkItemPendingType sse_decode_my_network_item_pending_type(
      SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_i_32(deserializer);
    return MyNetworkItemPendingType.values[inner];
  }

  @protected
  int sse_decode_u_64(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint64();
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8();
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_download_callback_data(
      DownloadCallbackData self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_String(self.id, serializer);
    sse_encode_u_64(self.total, serializer);
    sse_encode_u_64(self.progress, serializer);
    sse_encode_u_64(self.speed, serializer);
    sse_encode_my_downloader_status(self.status, serializer);
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putInt32(self);
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_my_downloader_status(
      MyDownloaderStatus self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    switch (self) {
      case MyDownloaderStatus_NoStart():
        sse_encode_i_32(0, serializer);
      case MyDownloaderStatus_Running():
        sse_encode_i_32(1, serializer);
      case MyDownloaderStatus_Pending(field0: final field0):
        sse_encode_i_32(2, serializer);
        sse_encode_my_network_item_pending_type(field0, serializer);
      case MyDownloaderStatus_Error(field0: final field0):
        sse_encode_i_32(3, serializer);
        sse_encode_String(field0, serializer);
      case MyDownloaderStatus_Finished():
        sse_encode_i_32(4, serializer);
    }
  }

  @protected
  void sse_encode_my_network_item_pending_type(
      MyNetworkItemPendingType self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.index, serializer);
  }

  @protected
  void sse_encode_u_64(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint64(self);
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }
}
