// Helpers

// ignore_for_file: library_private_types_in_public_api, unused_element

import '../../core/typedefs.dart';
import '../../utils/app_utils.dart';

class ResponseModel<T> {
  final _ResponseHeadersModel? headers;
  final T body;

  const ResponseModel({
    this.headers,
    required this.body,
  });

  factory ResponseModel.fromJson(dynamic json) {
    return ResponseModel(
      // headers: _ResponseHeadersModel.fromJson(
      //   json['headers'] as JSON,
      // ),
      body: json as T,
    );
  }
}

class _ResponseHeadersModel {
  final bool error;
  final String message;
  final String? code;

  const _ResponseHeadersModel({
    required this.error,
    required this.message,
    this.code,
  });

  factory _ResponseHeadersModel.fromJson(JSON json) {
    return _ResponseHeadersModel(
      error: AppUtils.boolFromInt(json['error'] as int),
      message: json['message'] as String,
      code: json['code'] as String?,
    );
  }
}
