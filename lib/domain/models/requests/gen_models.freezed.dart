// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gen_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
    LoginRequest value,
    $Res Function(LoginRequest) then,
  ) = _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call({String email, String password, String? fcmToken});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fcmToken = freezed,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            fcmToken: freezed == fcmToken
                ? _value.fcmToken
                : fcmToken // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
    _$LoginRequestImpl value,
    $Res Function(_$LoginRequestImpl) then,
  ) = __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String? fcmToken});
}

/// @nodoc
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
    _$LoginRequestImpl _value,
    $Res Function(_$LoginRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fcmToken = freezed,
  }) {
    return _then(
      _$LoginRequestImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        fcmToken: freezed == fcmToken
            ? _value.fcmToken
            : fcmToken // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl({
    required this.email,
    required this.password,
    this.fcmToken,
  });

  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String? fcmToken;

  @override
  String toString() {
    return 'LoginRequest(email: $email, password: $password, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, fcmToken);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(this);
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest({
    required final String email,
    required final String password,
    final String? fcmToken,
  }) = _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String? get fcmToken;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateEmergencyContactRequest _$CreateEmergencyContactRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CreateEmergencyContactRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateEmergencyContactRequest {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  ServiceType get serviceType => throw _privateConstructorUsedError;

  /// Serializes this CreateEmergencyContactRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateEmergencyContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateEmergencyContactRequestCopyWith<CreateEmergencyContactRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEmergencyContactRequestCopyWith<$Res> {
  factory $CreateEmergencyContactRequestCopyWith(
    CreateEmergencyContactRequest value,
    $Res Function(CreateEmergencyContactRequest) then,
  ) =
      _$CreateEmergencyContactRequestCopyWithImpl<
        $Res,
        CreateEmergencyContactRequest
      >;
  @useResult
  $Res call({String name, String phone, ServiceType serviceType});
}

/// @nodoc
class _$CreateEmergencyContactRequestCopyWithImpl<
  $Res,
  $Val extends CreateEmergencyContactRequest
>
    implements $CreateEmergencyContactRequestCopyWith<$Res> {
  _$CreateEmergencyContactRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateEmergencyContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? serviceType = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            serviceType: null == serviceType
                ? _value.serviceType
                : serviceType // ignore: cast_nullable_to_non_nullable
                      as ServiceType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateEmergencyContactRequestImplCopyWith<$Res>
    implements $CreateEmergencyContactRequestCopyWith<$Res> {
  factory _$$CreateEmergencyContactRequestImplCopyWith(
    _$CreateEmergencyContactRequestImpl value,
    $Res Function(_$CreateEmergencyContactRequestImpl) then,
  ) = __$$CreateEmergencyContactRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phone, ServiceType serviceType});
}

/// @nodoc
class __$$CreateEmergencyContactRequestImplCopyWithImpl<$Res>
    extends
        _$CreateEmergencyContactRequestCopyWithImpl<
          $Res,
          _$CreateEmergencyContactRequestImpl
        >
    implements _$$CreateEmergencyContactRequestImplCopyWith<$Res> {
  __$$CreateEmergencyContactRequestImplCopyWithImpl(
    _$CreateEmergencyContactRequestImpl _value,
    $Res Function(_$CreateEmergencyContactRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateEmergencyContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? serviceType = null,
  }) {
    return _then(
      _$CreateEmergencyContactRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        serviceType: null == serviceType
            ? _value.serviceType
            : serviceType // ignore: cast_nullable_to_non_nullable
                  as ServiceType,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateEmergencyContactRequestImpl
    implements _CreateEmergencyContactRequest {
  const _$CreateEmergencyContactRequestImpl({
    required this.name,
    required this.phone,
    required this.serviceType,
  });

  factory _$CreateEmergencyContactRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CreateEmergencyContactRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final ServiceType serviceType;

  @override
  String toString() {
    return 'CreateEmergencyContactRequest(name: $name, phone: $phone, serviceType: $serviceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEmergencyContactRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone, serviceType);

  /// Create a copy of CreateEmergencyContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEmergencyContactRequestImplCopyWith<
    _$CreateEmergencyContactRequestImpl
  >
  get copyWith =>
      __$$CreateEmergencyContactRequestImplCopyWithImpl<
        _$CreateEmergencyContactRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateEmergencyContactRequestImplToJson(this);
  }
}

abstract class _CreateEmergencyContactRequest
    implements CreateEmergencyContactRequest {
  const factory _CreateEmergencyContactRequest({
    required final String name,
    required final String phone,
    required final ServiceType serviceType,
  }) = _$CreateEmergencyContactRequestImpl;

  factory _CreateEmergencyContactRequest.fromJson(Map<String, dynamic> json) =
      _$CreateEmergencyContactRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get phone;
  @override
  ServiceType get serviceType;

  /// Create a copy of CreateEmergencyContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateEmergencyContactRequestImplCopyWith<
    _$CreateEmergencyContactRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

UpdateEmergencyContactRequest _$UpdateEmergencyContactRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateEmergencyContactRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateEmergencyContactRequest {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  ServiceType get serviceType => throw _privateConstructorUsedError;

  /// Serializes this UpdateEmergencyContactRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateEmergencyContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateEmergencyContactRequestCopyWith<UpdateEmergencyContactRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateEmergencyContactRequestCopyWith<$Res> {
  factory $UpdateEmergencyContactRequestCopyWith(
    UpdateEmergencyContactRequest value,
    $Res Function(UpdateEmergencyContactRequest) then,
  ) =
      _$UpdateEmergencyContactRequestCopyWithImpl<
        $Res,
        UpdateEmergencyContactRequest
      >;
  @useResult
  $Res call({String name, String phone, ServiceType serviceType});
}

/// @nodoc
class _$UpdateEmergencyContactRequestCopyWithImpl<
  $Res,
  $Val extends UpdateEmergencyContactRequest
>
    implements $UpdateEmergencyContactRequestCopyWith<$Res> {
  _$UpdateEmergencyContactRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateEmergencyContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? serviceType = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            serviceType: null == serviceType
                ? _value.serviceType
                : serviceType // ignore: cast_nullable_to_non_nullable
                      as ServiceType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateEmergencyContactRequestImplCopyWith<$Res>
    implements $UpdateEmergencyContactRequestCopyWith<$Res> {
  factory _$$UpdateEmergencyContactRequestImplCopyWith(
    _$UpdateEmergencyContactRequestImpl value,
    $Res Function(_$UpdateEmergencyContactRequestImpl) then,
  ) = __$$UpdateEmergencyContactRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phone, ServiceType serviceType});
}

/// @nodoc
class __$$UpdateEmergencyContactRequestImplCopyWithImpl<$Res>
    extends
        _$UpdateEmergencyContactRequestCopyWithImpl<
          $Res,
          _$UpdateEmergencyContactRequestImpl
        >
    implements _$$UpdateEmergencyContactRequestImplCopyWith<$Res> {
  __$$UpdateEmergencyContactRequestImplCopyWithImpl(
    _$UpdateEmergencyContactRequestImpl _value,
    $Res Function(_$UpdateEmergencyContactRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateEmergencyContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? serviceType = null,
  }) {
    return _then(
      _$UpdateEmergencyContactRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        serviceType: null == serviceType
            ? _value.serviceType
            : serviceType // ignore: cast_nullable_to_non_nullable
                  as ServiceType,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateEmergencyContactRequestImpl
    implements _UpdateEmergencyContactRequest {
  const _$UpdateEmergencyContactRequestImpl({
    required this.name,
    required this.phone,
    required this.serviceType,
  });

  factory _$UpdateEmergencyContactRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$UpdateEmergencyContactRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final ServiceType serviceType;

  @override
  String toString() {
    return 'UpdateEmergencyContactRequest(name: $name, phone: $phone, serviceType: $serviceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEmergencyContactRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone, serviceType);

  /// Create a copy of UpdateEmergencyContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEmergencyContactRequestImplCopyWith<
    _$UpdateEmergencyContactRequestImpl
  >
  get copyWith =>
      __$$UpdateEmergencyContactRequestImplCopyWithImpl<
        _$UpdateEmergencyContactRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateEmergencyContactRequestImplToJson(this);
  }
}

abstract class _UpdateEmergencyContactRequest
    implements UpdateEmergencyContactRequest {
  const factory _UpdateEmergencyContactRequest({
    required final String name,
    required final String phone,
    required final ServiceType serviceType,
  }) = _$UpdateEmergencyContactRequestImpl;

  factory _UpdateEmergencyContactRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateEmergencyContactRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get phone;
  @override
  ServiceType get serviceType;

  /// Create a copy of UpdateEmergencyContactRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateEmergencyContactRequestImplCopyWith<
    _$UpdateEmergencyContactRequestImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
