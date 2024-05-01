// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'register_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterAccount _$$_RegisterAccountFromJson(Map<String, dynamic> json) =>
    _$_RegisterAccount(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
      deviceName: json['device_name'] as String?,
    );

Map<String, dynamic> _$$_RegisterAccountToJson(_$_RegisterAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('phone', instance.phone);
  writeNotNull('password', instance.password);
  writeNotNull('gender', instance.gender);
  writeNotNull('device_name', instance.deviceName);
  return val;
}
