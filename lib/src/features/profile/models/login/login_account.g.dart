// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginAccount _$$_LoginAccountFromJson(Map<String, dynamic> json) =>
    _$_LoginAccount(
      phone: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$_LoginAccountToJson(_$_LoginAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.phone);
  writeNotNull('password', instance.password);
  return val;
}
