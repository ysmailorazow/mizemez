// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'login_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginAccount _$$_LoginAccountFromJson(Map<String, dynamic> json) =>
    _$_LoginAccount(
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      deviceName: json['device_name'] as String?,
    );

Map<String, dynamic> _$$_LoginAccountToJson(_$_LoginAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone', instance.phone);
  writeNotNull('password', instance.password);
  writeNotNull('device_name', instance.deviceName);
  return val;
}
