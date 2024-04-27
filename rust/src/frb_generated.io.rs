// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0-dev.32.

// Section: imports

use super::*;
use flutter_rust_bridge::for_generated::byteorder::{NativeEndian, ReadBytesExt, WriteBytesExt};
use flutter_rust_bridge::for_generated::transform_result_dco;
use flutter_rust_bridge::{Handler, IntoIntoDart};

// Section: boilerplate

flutter_rust_bridge::frb_generated_boilerplate_io!();

// Section: dart2rust

impl CstDecode<flutter_rust_bridge::for_generated::anyhow::Error>
    for *mut wire_cst_list_prim_u_8_strict
{
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> flutter_rust_bridge::for_generated::anyhow::Error {
        unimplemented!()
    }
}
impl CstDecode<std::collections::HashMap<String, String>>
    for *mut wire_cst_list_record_string_string
{
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> std::collections::HashMap<String, String> {
        let vec: Vec<(String, String)> = self.cst_decode();
        vec.into_iter().collect()
    }
}
impl
    CstDecode<
        StreamSink<
            crate::api::rs_process::RsProcessStreamData,
            flutter_rust_bridge::for_generated::DcoCodec,
        >,
    > for *mut wire_cst_list_prim_u_8_strict
{
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(
        self,
    ) -> StreamSink<
        crate::api::rs_process::RsProcessStreamData,
        flutter_rust_bridge::for_generated::DcoCodec,
    > {
        let raw: String = self.cst_decode();
        StreamSink::deserialize(raw)
    }
}
impl CstDecode<String> for *mut wire_cst_list_prim_u_8_strict {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> String {
        let vec: Vec<u8> = self.cst_decode();
        String::from_utf8(vec).unwrap()
    }
}
impl CstDecode<u64> for *mut u64 {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> u64 {
        unsafe { *flutter_rust_bridge::for_generated::box_from_leak_ptr(self) }
    }
}
impl CstDecode<Vec<String>> for *mut wire_cst_list_String {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> Vec<String> {
        let vec = unsafe {
            let wrap = flutter_rust_bridge::for_generated::box_from_leak_ptr(self);
            flutter_rust_bridge::for_generated::vec_from_leak_ptr(wrap.ptr, wrap.len)
        };
        vec.into_iter().map(CstDecode::cst_decode).collect()
    }
}
impl CstDecode<Vec<u8>> for *mut wire_cst_list_prim_u_8_strict {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> Vec<u8> {
        unsafe {
            let wrap = flutter_rust_bridge::for_generated::box_from_leak_ptr(self);
            flutter_rust_bridge::for_generated::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
impl CstDecode<Vec<(String, String)>> for *mut wire_cst_list_record_string_string {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> Vec<(String, String)> {
        let vec = unsafe {
            let wrap = flutter_rust_bridge::for_generated::box_from_leak_ptr(self);
            flutter_rust_bridge::for_generated::vec_from_leak_ptr(wrap.ptr, wrap.len)
        };
        vec.into_iter().map(CstDecode::cst_decode).collect()
    }
}
impl CstDecode<(String, String)> for wire_cst_record_string_string {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> (String, String) {
        (self.field0.cst_decode(), self.field1.cst_decode())
    }
}
impl CstDecode<crate::api::rs_process::RsProcessStreamData> for wire_cst_rs_process_stream_data {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::api::rs_process::RsProcessStreamData {
        crate::api::rs_process::RsProcessStreamData {
            data_type: self.data_type.cst_decode(),
            data: self.data.cst_decode(),
            rs_pid: self.rs_pid.cst_decode(),
        }
    }
}
impl CstDecode<crate::http_package::RustHttpResponse> for wire_cst_rust_http_response {
    // Codec=Cst (C-struct based), see doc to use other codecs
    fn cst_decode(self) -> crate::http_package::RustHttpResponse {
        crate::http_package::RustHttpResponse {
            status_code: self.status_code.cst_decode(),
            headers: self.headers.cst_decode(),
            url: self.url.cst_decode(),
            content_length: self.content_length.cst_decode(),
            version: self.version.cst_decode(),
            remote_addr: self.remote_addr.cst_decode(),
            data: self.data.cst_decode(),
        }
    }
}
impl NewWithNullPtr for wire_cst_record_string_string {
    fn new_with_null_ptr() -> Self {
        Self {
            field0: core::ptr::null_mut(),
            field1: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_record_string_string {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_rs_process_stream_data {
    fn new_with_null_ptr() -> Self {
        Self {
            data_type: Default::default(),
            data: core::ptr::null_mut(),
            rs_pid: Default::default(),
        }
    }
}
impl Default for wire_cst_rs_process_stream_data {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
impl NewWithNullPtr for wire_cst_rust_http_response {
    fn new_with_null_ptr() -> Self {
        Self {
            status_code: Default::default(),
            headers: core::ptr::null_mut(),
            url: core::ptr::null_mut(),
            content_length: core::ptr::null_mut(),
            version: Default::default(),
            remote_addr: core::ptr::null_mut(),
            data: core::ptr::null_mut(),
        }
    }
}
impl Default for wire_cst_rust_http_response {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

#[no_mangle]
pub extern "C" fn frbgen_starcitizen_doctor_wire_dns_lookup_ips(
    port_: i64,
    host: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_dns_lookup_ips_impl(port_, host)
}

#[no_mangle]
pub extern "C" fn frbgen_starcitizen_doctor_wire_dns_lookup_txt(
    port_: i64,
    host: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_dns_lookup_txt_impl(port_, host)
}

#[no_mangle]
pub extern "C" fn frbgen_starcitizen_doctor_wire_fetch(
    port_: i64,
    method: i32,
    url: *mut wire_cst_list_prim_u_8_strict,
    headers: *mut wire_cst_list_record_string_string,
    input_data: *mut wire_cst_list_prim_u_8_strict,
    with_ip_address: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_fetch_impl(port_, method, url, headers, input_data, with_ip_address)
}

#[no_mangle]
pub extern "C" fn frbgen_starcitizen_doctor_wire_set_default_header(
    port_: i64,
    headers: *mut wire_cst_list_record_string_string,
) {
    wire_set_default_header_impl(port_, headers)
}

#[no_mangle]
pub extern "C" fn frbgen_starcitizen_doctor_wire_send_notify(
    port_: i64,
    summary: *mut wire_cst_list_prim_u_8_strict,
    body: *mut wire_cst_list_prim_u_8_strict,
    app_name: *mut wire_cst_list_prim_u_8_strict,
    app_id: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_send_notify_impl(port_, summary, body, app_name, app_id)
}

#[no_mangle]
pub extern "C" fn frbgen_starcitizen_doctor_wire_start(
    port_: i64,
    executable: *mut wire_cst_list_prim_u_8_strict,
    arguments: *mut wire_cst_list_String,
    working_directory: *mut wire_cst_list_prim_u_8_strict,
    stream_sink: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_start_impl(port_, executable, arguments, working_directory, stream_sink)
}

#[no_mangle]
pub extern "C" fn frbgen_starcitizen_doctor_wire_write(
    port_: i64,
    rs_pid: u32,
    data: *mut wire_cst_list_prim_u_8_strict,
) {
    wire_write_impl(port_, rs_pid, data)
}

#[no_mangle]
pub extern "C" fn frbgen_starcitizen_doctor_cst_new_box_autoadd_u_64(value: u64) -> *mut u64 {
    flutter_rust_bridge::for_generated::new_leak_box_ptr(value)
}

#[no_mangle]
pub extern "C" fn frbgen_starcitizen_doctor_cst_new_list_String(
    len: i32,
) -> *mut wire_cst_list_String {
    let wrap = wire_cst_list_String {
        ptr: flutter_rust_bridge::for_generated::new_leak_vec_ptr(
            <*mut wire_cst_list_prim_u_8_strict>::new_with_null_ptr(),
            len,
        ),
        len,
    };
    flutter_rust_bridge::for_generated::new_leak_box_ptr(wrap)
}

#[no_mangle]
pub extern "C" fn frbgen_starcitizen_doctor_cst_new_list_prim_u_8_strict(
    len: i32,
) -> *mut wire_cst_list_prim_u_8_strict {
    let ans = wire_cst_list_prim_u_8_strict {
        ptr: flutter_rust_bridge::for_generated::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    flutter_rust_bridge::for_generated::new_leak_box_ptr(ans)
}

#[no_mangle]
pub extern "C" fn frbgen_starcitizen_doctor_cst_new_list_record_string_string(
    len: i32,
) -> *mut wire_cst_list_record_string_string {
    let wrap = wire_cst_list_record_string_string {
        ptr: flutter_rust_bridge::for_generated::new_leak_vec_ptr(
            <wire_cst_record_string_string>::new_with_null_ptr(),
            len,
        ),
        len,
    };
    flutter_rust_bridge::for_generated::new_leak_box_ptr(wrap)
}

#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_list_String {
    ptr: *mut *mut wire_cst_list_prim_u_8_strict,
    len: i32,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_list_prim_u_8_strict {
    ptr: *mut u8,
    len: i32,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_list_record_string_string {
    ptr: *mut wire_cst_record_string_string,
    len: i32,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_record_string_string {
    field0: *mut wire_cst_list_prim_u_8_strict,
    field1: *mut wire_cst_list_prim_u_8_strict,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_rs_process_stream_data {
    data_type: i32,
    data: *mut wire_cst_list_prim_u_8_strict,
    rs_pid: u32,
}
#[repr(C)]
#[derive(Clone, Copy)]
pub struct wire_cst_rust_http_response {
    status_code: u16,
    headers: *mut wire_cst_list_record_string_string,
    url: *mut wire_cst_list_prim_u_8_strict,
    content_length: *mut u64,
    version: i32,
    remote_addr: *mut wire_cst_list_prim_u_8_strict,
    data: *mut wire_cst_list_prim_u_8_strict,
}
