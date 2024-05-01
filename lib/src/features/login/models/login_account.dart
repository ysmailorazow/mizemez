// To parse this JSON data, do
//
//     final registerAccount = registerAccountFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_account.freezed.dart';
part 'login_account.g.dart';

@freezed
class LoginAccount with _$LoginAccount {
  @JsonSerializable(includeIfNull: false)
  const factory LoginAccount({
    @JsonKey(name: 'phone') String? phone,
    String? password,
    @JsonKey(name: 'device_name') String? deviceName,
  }) = _LoginAccount;

  factory LoginAccount.fromJson(Map<String, dynamic> json) =>
      _$LoginAccountFromJson(json);
}
