// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

/// An enum that holds names for our custom exceptions.
enum ExceptionType {
  /// The exception for an expired bearer token.
  TokenExpiredException,

  /// The exception for a prematurely cancelled request.
  CancelException,

  /// The exception for a failed connection attempt.
  ConnectTimeoutException,

  /// The exception for failing to send a request.
  SendTimeoutException,

  /// The exception for failing to receive a response.
  ReceiveTimeoutException,

  /// The exception for no internet connectivity.
  SocketException,

  /// A better name for the socket exception.
  FetchDataException,

  /// The exception for an incorrect parameter in a request/response.
  FormatException,

  /// The exception for an unknown type of failure.
  UnrecognizedException,

  /// The exception for an unknown exception from the api.
  ApiException,

  /// The exception for any parsing failure encountered during
  /// serialization/deserialization of a request.
  SerializationException,

  UnauthorizedException,
}

class CustomException implements Exception {
  final String name, message;
  final String? code;
  final int? statusCode;
  final ExceptionType exceptionType;

  CustomException({
    this.code,
    int? statusCode,
    required this.message,
    this.exceptionType = ExceptionType.ApiException,
  })  : statusCode = statusCode ?? 500,
        name = exceptionType.name;

  factory CustomException.fromDioException(Exception error) {
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            return CustomException(
              exceptionType: ExceptionType.CancelException,
              statusCode: error.response?.statusCode,
              message: 'Request cancelled prematurely',
            );
          case DioErrorType.connectTimeout:
            return CustomException(
              exceptionType: ExceptionType.ConnectTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Connection not established',
            );
          case DioErrorType.sendTimeout:
            return CustomException(
              exceptionType: ExceptionType.SendTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to send',
            );
          case DioErrorType.receiveTimeout:
            return CustomException(
              exceptionType: ExceptionType.ReceiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to receive',
            );
          case DioErrorType.response:
            if (error.response?.statusCode == 401) {
              return CustomException(
                exceptionType: ExceptionType.UnauthorizedException,
                statusCode: error.response?.statusCode,
                message: 'Authentication credentials were not provided.',
              );
            }
            if (error.message.contains('Unauthenticated')) {
              return CustomException(
                exceptionType: ExceptionType.UnauthorizedException,
                statusCode: error.response?.statusCode,
                message: 'Authentication credentials were not provided.',
              );
            }
            return CustomException(
              exceptionType: ExceptionType.UnrecognizedException,
              message: 'Response error',
            );
          case DioErrorType.other:
            if (error.message.contains(ExceptionType.SocketException.name)) {
              return CustomException(
                exceptionType: ExceptionType.FetchDataException,
                statusCode: error.response?.statusCode,
                message: r'network_error'.tr,
              );
            }
            if (error.response?.data is String ||
                error.response?.data == null) {
              return CustomException(
                exceptionType: ExceptionType.UnrecognizedException,
                statusCode: error.response?.statusCode,
                message: error.response?.statusMessage ?? 'Unknown',
              );
            }
            const name = 'name';
            final message = error.response?.data;
            if (name == ExceptionType.TokenExpiredException.name) {
              return CustomException(
                exceptionType: ExceptionType.TokenExpiredException,
                code: name,
                statusCode: error.response?.statusCode,
                message: message,
              );
            }
            return CustomException(
              message: message.toString(),
              code: name,
              statusCode: error.response?.statusCode,
            );
        }
      } else {
        return CustomException(
          exceptionType: ExceptionType.UnrecognizedException,
          message: 'Error unrecognized',
        );
      }
    } on FormatException catch (e) {
      return CustomException(
        exceptionType: ExceptionType.FormatException,
        message: e.message,
      );
    } on Exception catch (_) {
      return CustomException(
        exceptionType: ExceptionType.UnrecognizedException,
        message: 'Error unrecognized',
      );
    }
  }

  factory CustomException.fromParsingException(Exception error) {
    debugPrint('fromParsingException: $error');
    return CustomException(
      exceptionType: ExceptionType.SerializationException,
      message: 'Failed to parse network response to model or vice versa',
    );
  }
}
