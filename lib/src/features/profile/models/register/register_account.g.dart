// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterAccount _$$_RegisterAccountFromJson(Map<String, dynamic> json) =>
    _$_RegisterAccount(
      firstName: json['name'] as String?,
      phone: json['email'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
    );

Map<String, dynamic> _$$_RegisterAccountToJson(_$_RegisterAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.firstName);
  writeNotNull('email', instance.phone);
  writeNotNull('password', instance.password);
  writeNotNull('password_confirmation', instance.passwordConfirmation);
  return val;
}
