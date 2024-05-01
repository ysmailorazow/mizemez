// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginAccount _$LoginAccountFromJson(Map<String, dynamic> json) {
  return _LoginAccount.fromJson(json);
}

/// @nodoc
mixin _$LoginAccount {
  @JsonKey(name: 'email')
  String? get phone => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginAccountCopyWith<LoginAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginAccountCopyWith<$Res> {
  factory $LoginAccountCopyWith(
          LoginAccount value, $Res Function(LoginAccount) then) =
      _$LoginAccountCopyWithImpl<$Res, LoginAccount>;
  @useResult
  $Res call({@JsonKey(name: 'email') String? phone, String? password});
}

/// @nodoc
class _$LoginAccountCopyWithImpl<$Res, $Val extends LoginAccount>
    implements $LoginAccountCopyWith<$Res> {
  _$LoginAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginAccountCopyWith<$Res>
    implements $LoginAccountCopyWith<$Res> {
  factory _$$_LoginAccountCopyWith(
          _$_LoginAccount value, $Res Function(_$_LoginAccount) then) =
      __$$_LoginAccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'email') String? phone, String? password});
}

/// @nodoc
class __$$_LoginAccountCopyWithImpl<$Res>
    extends _$LoginAccountCopyWithImpl<$Res, _$_LoginAccount>
    implements _$$_LoginAccountCopyWith<$Res> {
  __$$_LoginAccountCopyWithImpl(
      _$_LoginAccount _value, $Res Function(_$_LoginAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_LoginAccount(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_LoginAccount implements _LoginAccount {
  const _$_LoginAccount({@JsonKey(name: 'email') this.phone, this.password});

  factory _$_LoginAccount.fromJson(Map<String, dynamic> json) =>
      _$$_LoginAccountFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String? phone;
  @override
  final String? password;

  @override
  String toString() {
    return 'LoginAccount(phone: $phone, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginAccount &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phone, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginAccountCopyWith<_$_LoginAccount> get copyWith =>
      __$$_LoginAccountCopyWithImpl<_$_LoginAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginAccountToJson(
      this,
    );
  }
}

abstract class _LoginAccount implements LoginAccount {
  const factory _LoginAccount(
      {@JsonKey(name: 'email') final String? phone,
      final String? password}) = _$_LoginAccount;

  factory _LoginAccount.fromJson(Map<String, dynamic> json) =
      _$_LoginAccount.fromJson;

  @override
  @JsonKey(name: 'email')
  String? get phone;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginAccountCopyWith<_$_LoginAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
