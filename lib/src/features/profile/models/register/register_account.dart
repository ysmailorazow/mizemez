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
    @JsonKey(name: 'name') String? firstName,
    @JsonKey(name: 'email') String? phone,
    String? password,
    @JsonKey(name: 'password_confirmation') String? passwordConfirmation,
  }) = _RegisterAccount;

  factory RegisterAccount.fromJson(Map<String, dynamic> json) =>
      _$RegisterAccountFromJson(json);
}
