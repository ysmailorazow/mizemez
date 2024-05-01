// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterAccount _$RegisterAccountFromJson(Map<String, dynamic> json) {
  return _RegisterAccount.fromJson(json);
}

/// @nodoc
mixin _$RegisterAccount {
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'dropdown')
  String? get dropdown => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_name')
  String? get deviceName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterAccountCopyWith<RegisterAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterAccountCopyWith<$Res> {
  factory $RegisterAccountCopyWith(
          RegisterAccount value, $Res Function(RegisterAccount) then) =
      _$RegisterAccountCopyWithImpl<$Res, RegisterAccount>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'phone') String? phone,
      String? password,
      String? gender,
        @JsonKey(name: 'dropdown') String? dropdown,
      @JsonKey(name: 'device_name') String? deviceName});
}

/// @nodoc
class _$RegisterAccountCopyWithImpl<$Res, $Val extends RegisterAccount>
    implements $RegisterAccountCopyWith<$Res> {
  _$RegisterAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? gender = freezed,
    Object? dropdown = freezed,
    Object? deviceName = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dropdown: freezed == dropdown
          ? _value.dropdown
          : dropdown // ignore: cast_nullable_to_non_nullable
      as String?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterAccountCopyWith<$Res>
    implements $RegisterAccountCopyWith<$Res> {
  factory _$$_RegisterAccountCopyWith(
          _$_RegisterAccount value, $Res Function(_$_RegisterAccount) then) =
      __$$_RegisterAccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'phone') String? phone,
      String? password,
      String? gender,
        @JsonKey(name: 'dropdown') String? dropdown,
      @JsonKey(name: 'device_name') String? deviceName});
}

/// @nodoc
class __$$_RegisterAccountCopyWithImpl<$Res>
    extends _$RegisterAccountCopyWithImpl<$Res, _$_RegisterAccount>
    implements _$$_RegisterAccountCopyWith<$Res> {
  __$$_RegisterAccountCopyWithImpl(
      _$_RegisterAccount _value, $Res Function(_$_RegisterAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? gender = freezed,
    Object? dropdown = freezed,
    Object? deviceName = freezed,
  }) {
    return _then(_$_RegisterAccount(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dropdown: freezed == dropdown
          ? _value.dropdown
          : dropdown // ignore: cast_nullable_to_non_nullable
      as String?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_RegisterAccount implements _RegisterAccount {
  const _$_RegisterAccount(
      {@JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'phone') this.phone,
      this.password,
      this.gender,
        @JsonKey(name: 'dropdown') this.dropdown,
      @JsonKey(name: 'device_name') this.deviceName});

  factory _$_RegisterAccount.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterAccountFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  final String? password;
  @override
  final String? gender;
  @override
  final String? dropdown;
  @override
  @JsonKey(name: 'device_name')
  final String? deviceName;

  @override
  String toString() {
    return 'RegisterAccount(firstName: $firstName, lastName: $lastName, phone: $phone, password: $password, gender: $gender,dropdown:$dropdown, deviceName: $deviceName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterAccount &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstName, lastName, phone, password, gender, dropdown, deviceName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterAccountCopyWith<_$_RegisterAccount> get copyWith =>
      __$$_RegisterAccountCopyWithImpl<_$_RegisterAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterAccountToJson(
      this,
    );
  }
}

abstract class _RegisterAccount implements RegisterAccount {
  const factory _RegisterAccount(
          {@JsonKey(name: 'first_name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          @JsonKey(name: 'phone') final String? phone,
          final String? password,
          final String? gender,
            @JsonKey(name: 'dropdown') final String? dropdown,
          @JsonKey(name: 'device_name') final String? deviceName}) =
      _$_RegisterAccount;


  factory _RegisterAccount.fromJson(Map<String, dynamic> json) =
      _$_RegisterAccount.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  String? get password;
  @override
  String? get dropdown;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'device_name')
  String? get deviceName;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterAccountCopyWith<_$_RegisterAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
