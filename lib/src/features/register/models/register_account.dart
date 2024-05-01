// To parse this JSON data, do
//
//     final registerAccount = registerAccountFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_account.freezed.dart';
part 'register_account.g.dart';

@freezed
class RegisterAccount with _$RegisterAccount {
  @JsonSerializable(includeIfNull: false)
  const factory RegisterAccount({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'phone') String? phone,
    String? password,
    String? gender,
    @JsonKey(name: 'device_name') String? deviceName,
    @JsonKey(name: 'dropdown') String? dropdown,


  }) = _RegisterAccount;

  factory RegisterAccount.fromJson(Map<String, dynamic> json) =>
      _$RegisterAccountFromJson(json);
}
