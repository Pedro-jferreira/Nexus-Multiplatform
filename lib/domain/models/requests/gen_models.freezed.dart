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

UpdatePasswordRequest _$UpdatePasswordRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpdatePasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdatePasswordRequest {
  String get currentPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get confirmNewPassword => throw _privateConstructorUsedError;

  /// Serializes this UpdatePasswordRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePasswordRequestCopyWith<UpdatePasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePasswordRequestCopyWith<$Res> {
  factory $UpdatePasswordRequestCopyWith(
    UpdatePasswordRequest value,
    $Res Function(UpdatePasswordRequest) then,
  ) = _$UpdatePasswordRequestCopyWithImpl<$Res, UpdatePasswordRequest>;
  @useResult
  $Res call({
    String currentPassword,
    String newPassword,
    String confirmNewPassword,
  });
}

/// @nodoc
class _$UpdatePasswordRequestCopyWithImpl<
  $Res,
  $Val extends UpdatePasswordRequest
>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  _$UpdatePasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
    Object? confirmNewPassword = null,
  }) {
    return _then(
      _value.copyWith(
            currentPassword: null == currentPassword
                ? _value.currentPassword
                : currentPassword // ignore: cast_nullable_to_non_nullable
                      as String,
            newPassword: null == newPassword
                ? _value.newPassword
                : newPassword // ignore: cast_nullable_to_non_nullable
                      as String,
            confirmNewPassword: null == confirmNewPassword
                ? _value.confirmNewPassword
                : confirmNewPassword // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdatePasswordRequestImplCopyWith<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  factory _$$UpdatePasswordRequestImplCopyWith(
    _$UpdatePasswordRequestImpl value,
    $Res Function(_$UpdatePasswordRequestImpl) then,
  ) = __$$UpdatePasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String currentPassword,
    String newPassword,
    String confirmNewPassword,
  });
}

/// @nodoc
class __$$UpdatePasswordRequestImplCopyWithImpl<$Res>
    extends
        _$UpdatePasswordRequestCopyWithImpl<$Res, _$UpdatePasswordRequestImpl>
    implements _$$UpdatePasswordRequestImplCopyWith<$Res> {
  __$$UpdatePasswordRequestImplCopyWithImpl(
    _$UpdatePasswordRequestImpl _value,
    $Res Function(_$UpdatePasswordRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
    Object? confirmNewPassword = null,
  }) {
    return _then(
      _$UpdatePasswordRequestImpl(
        currentPassword: null == currentPassword
            ? _value.currentPassword
            : currentPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        newPassword: null == newPassword
            ? _value.newPassword
            : newPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        confirmNewPassword: null == confirmNewPassword
            ? _value.confirmNewPassword
            : confirmNewPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePasswordRequestImpl implements _UpdatePasswordRequest {
  const _$UpdatePasswordRequestImpl({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  factory _$UpdatePasswordRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePasswordRequestImplFromJson(json);

  @override
  final String currentPassword;
  @override
  final String newPassword;
  @override
  final String confirmNewPassword;

  @override
  String toString() {
    return 'UpdatePasswordRequest(currentPassword: $currentPassword, newPassword: $newPassword, confirmNewPassword: $confirmNewPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordRequestImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmNewPassword, confirmNewPassword) ||
                other.confirmNewPassword == confirmNewPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentPassword,
    newPassword,
    confirmNewPassword,
  );

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordRequestImplCopyWith<_$UpdatePasswordRequestImpl>
  get copyWith =>
      __$$UpdatePasswordRequestImplCopyWithImpl<_$UpdatePasswordRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePasswordRequestImplToJson(this);
  }
}

abstract class _UpdatePasswordRequest implements UpdatePasswordRequest {
  const factory _UpdatePasswordRequest({
    required final String currentPassword,
    required final String newPassword,
    required final String confirmNewPassword,
  }) = _$UpdatePasswordRequestImpl;

  factory _UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =
      _$UpdatePasswordRequestImpl.fromJson;

  @override
  String get currentPassword;
  @override
  String get newPassword;
  @override
  String get confirmNewPassword;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePasswordRequestImplCopyWith<_$UpdatePasswordRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UnlockAccountRequest _$UnlockAccountRequestFromJson(Map<String, dynamic> json) {
  return _UnlockAccountRequest.fromJson(json);
}

/// @nodoc
mixin _$UnlockAccountRequest {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this UnlockAccountRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnlockAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnlockAccountRequestCopyWith<UnlockAccountRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnlockAccountRequestCopyWith<$Res> {
  factory $UnlockAccountRequestCopyWith(
    UnlockAccountRequest value,
    $Res Function(UnlockAccountRequest) then,
  ) = _$UnlockAccountRequestCopyWithImpl<$Res, UnlockAccountRequest>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$UnlockAccountRequestCopyWithImpl<
  $Res,
  $Val extends UnlockAccountRequest
>
    implements $UnlockAccountRequestCopyWith<$Res> {
  _$UnlockAccountRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnlockAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UnlockAccountRequestImplCopyWith<$Res>
    implements $UnlockAccountRequestCopyWith<$Res> {
  factory _$$UnlockAccountRequestImplCopyWith(
    _$UnlockAccountRequestImpl value,
    $Res Function(_$UnlockAccountRequestImpl) then,
  ) = __$$UnlockAccountRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$UnlockAccountRequestImplCopyWithImpl<$Res>
    extends _$UnlockAccountRequestCopyWithImpl<$Res, _$UnlockAccountRequestImpl>
    implements _$$UnlockAccountRequestImplCopyWith<$Res> {
  __$$UnlockAccountRequestImplCopyWithImpl(
    _$UnlockAccountRequestImpl _value,
    $Res Function(_$UnlockAccountRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UnlockAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$UnlockAccountRequestImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UnlockAccountRequestImpl implements _UnlockAccountRequest {
  const _$UnlockAccountRequestImpl({required this.email});

  factory _$UnlockAccountRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnlockAccountRequestImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'UnlockAccountRequest(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnlockAccountRequestImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of UnlockAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnlockAccountRequestImplCopyWith<_$UnlockAccountRequestImpl>
  get copyWith =>
      __$$UnlockAccountRequestImplCopyWithImpl<_$UnlockAccountRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UnlockAccountRequestImplToJson(this);
  }
}

abstract class _UnlockAccountRequest implements UnlockAccountRequest {
  const factory _UnlockAccountRequest({required final String email}) =
      _$UnlockAccountRequestImpl;

  factory _UnlockAccountRequest.fromJson(Map<String, dynamic> json) =
      _$UnlockAccountRequestImpl.fromJson;

  @override
  String get email;

  /// Create a copy of UnlockAccountRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnlockAccountRequestImplCopyWith<_$UnlockAccountRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
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

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) {
  return _CreateUserRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateUserRequest {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  AuthProvider get authProvider => throw _privateConstructorUsedError;
  bool get provisionalPassword => throw _privateConstructorUsedError;

  /// Serializes this CreateUserRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateUserRequestCopyWith<CreateUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserRequestCopyWith<$Res> {
  factory $CreateUserRequestCopyWith(
    CreateUserRequest value,
    $Res Function(CreateUserRequest) then,
  ) = _$CreateUserRequestCopyWithImpl<$Res, CreateUserRequest>;
  @useResult
  $Res call({
    String name,
    String email,
    Role role,
    AuthProvider authProvider,
    bool provisionalPassword,
  });
}

/// @nodoc
class _$CreateUserRequestCopyWithImpl<$Res, $Val extends CreateUserRequest>
    implements $CreateUserRequestCopyWith<$Res> {
  _$CreateUserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? authProvider = null,
    Object? provisionalPassword = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as Role,
            authProvider: null == authProvider
                ? _value.authProvider
                : authProvider // ignore: cast_nullable_to_non_nullable
                      as AuthProvider,
            provisionalPassword: null == provisionalPassword
                ? _value.provisionalPassword
                : provisionalPassword // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateUserRequestImplCopyWith<$Res>
    implements $CreateUserRequestCopyWith<$Res> {
  factory _$$CreateUserRequestImplCopyWith(
    _$CreateUserRequestImpl value,
    $Res Function(_$CreateUserRequestImpl) then,
  ) = __$$CreateUserRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String email,
    Role role,
    AuthProvider authProvider,
    bool provisionalPassword,
  });
}

/// @nodoc
class __$$CreateUserRequestImplCopyWithImpl<$Res>
    extends _$CreateUserRequestCopyWithImpl<$Res, _$CreateUserRequestImpl>
    implements _$$CreateUserRequestImplCopyWith<$Res> {
  __$$CreateUserRequestImplCopyWithImpl(
    _$CreateUserRequestImpl _value,
    $Res Function(_$CreateUserRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? authProvider = null,
    Object? provisionalPassword = null,
  }) {
    return _then(
      _$CreateUserRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as Role,
        authProvider: null == authProvider
            ? _value.authProvider
            : authProvider // ignore: cast_nullable_to_non_nullable
                  as AuthProvider,
        provisionalPassword: null == provisionalPassword
            ? _value.provisionalPassword
            : provisionalPassword // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateUserRequestImpl implements _CreateUserRequest {
  const _$CreateUserRequestImpl({
    required this.name,
    required this.email,
    required this.role,
    this.authProvider = AuthProvider.LOCAL,
    this.provisionalPassword = true,
  });

  factory _$CreateUserRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateUserRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final Role role;
  @override
  @JsonKey()
  final AuthProvider authProvider;
  @override
  @JsonKey()
  final bool provisionalPassword;

  @override
  String toString() {
    return 'CreateUserRequest(name: $name, email: $email, role: $role, authProvider: $authProvider, provisionalPassword: $provisionalPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.authProvider, authProvider) ||
                other.authProvider == authProvider) &&
            (identical(other.provisionalPassword, provisionalPassword) ||
                other.provisionalPassword == provisionalPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    email,
    role,
    authProvider,
    provisionalPassword,
  );

  /// Create a copy of CreateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserRequestImplCopyWith<_$CreateUserRequestImpl> get copyWith =>
      __$$CreateUserRequestImplCopyWithImpl<_$CreateUserRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserRequestImplToJson(this);
  }
}

abstract class _CreateUserRequest implements CreateUserRequest {
  const factory _CreateUserRequest({
    required final String name,
    required final String email,
    required final Role role,
    final AuthProvider authProvider,
    final bool provisionalPassword,
  }) = _$CreateUserRequestImpl;

  factory _CreateUserRequest.fromJson(Map<String, dynamic> json) =
      _$CreateUserRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  Role get role;
  @override
  AuthProvider get authProvider;
  @override
  bool get provisionalPassword;

  /// Create a copy of CreateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateUserRequestImplCopyWith<_$CreateUserRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) {
  return _UpdateUserRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserRequest {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  bool get enable => throw _privateConstructorUsedError;
  bool get locked => throw _privateConstructorUsedError;
  EnumStatus get status => throw _privateConstructorUsedError;

  /// Serializes this UpdateUserRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserRequestCopyWith<UpdateUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserRequestCopyWith<$Res> {
  factory $UpdateUserRequestCopyWith(
    UpdateUserRequest value,
    $Res Function(UpdateUserRequest) then,
  ) = _$UpdateUserRequestCopyWithImpl<$Res, UpdateUserRequest>;
  @useResult
  $Res call({
    String name,
    String email,
    Role role,
    bool enable,
    bool locked,
    EnumStatus status,
  });
}

/// @nodoc
class _$UpdateUserRequestCopyWithImpl<$Res, $Val extends UpdateUserRequest>
    implements $UpdateUserRequestCopyWith<$Res> {
  _$UpdateUserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? enable = null,
    Object? locked = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as Role,
            enable: null == enable
                ? _value.enable
                : enable // ignore: cast_nullable_to_non_nullable
                      as bool,
            locked: null == locked
                ? _value.locked
                : locked // ignore: cast_nullable_to_non_nullable
                      as bool,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as EnumStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateUserRequestImplCopyWith<$Res>
    implements $UpdateUserRequestCopyWith<$Res> {
  factory _$$UpdateUserRequestImplCopyWith(
    _$UpdateUserRequestImpl value,
    $Res Function(_$UpdateUserRequestImpl) then,
  ) = __$$UpdateUserRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String email,
    Role role,
    bool enable,
    bool locked,
    EnumStatus status,
  });
}

/// @nodoc
class __$$UpdateUserRequestImplCopyWithImpl<$Res>
    extends _$UpdateUserRequestCopyWithImpl<$Res, _$UpdateUserRequestImpl>
    implements _$$UpdateUserRequestImplCopyWith<$Res> {
  __$$UpdateUserRequestImplCopyWithImpl(
    _$UpdateUserRequestImpl _value,
    $Res Function(_$UpdateUserRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? enable = null,
    Object? locked = null,
    Object? status = null,
  }) {
    return _then(
      _$UpdateUserRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as Role,
        enable: null == enable
            ? _value.enable
            : enable // ignore: cast_nullable_to_non_nullable
                  as bool,
        locked: null == locked
            ? _value.locked
            : locked // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as EnumStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUserRequestImpl implements _UpdateUserRequest {
  const _$UpdateUserRequestImpl({
    required this.name,
    required this.email,
    required this.role,
    this.enable = false,
    this.locked = false,
    required this.status,
  });

  factory _$UpdateUserRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final Role role;
  @override
  @JsonKey()
  final bool enable;
  @override
  @JsonKey()
  final bool locked;
  @override
  final EnumStatus status;

  @override
  String toString() {
    return 'UpdateUserRequest(name: $name, email: $email, role: $role, enable: $enable, locked: $locked, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.enable, enable) || other.enable == enable) &&
            (identical(other.locked, locked) || other.locked == locked) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, role, enable, locked, status);

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserRequestImplCopyWith<_$UpdateUserRequestImpl> get copyWith =>
      __$$UpdateUserRequestImplCopyWithImpl<_$UpdateUserRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserRequestImplToJson(this);
  }
}

abstract class _UpdateUserRequest implements UpdateUserRequest {
  const factory _UpdateUserRequest({
    required final String name,
    required final String email,
    required final Role role,
    final bool enable,
    final bool locked,
    required final EnumStatus status,
  }) = _$UpdateUserRequestImpl;

  factory _UpdateUserRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateUserRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  Role get role;
  @override
  bool get enable;
  @override
  bool get locked;
  @override
  EnumStatus get status;

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserRequestImplCopyWith<_$UpdateUserRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserFilter _$UserFilterFromJson(Map<String, dynamic> json) {
  return _UserFilter.fromJson(json);
}

/// @nodoc
mixin _$UserFilter {
  Role? get role => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  EnumStatus? get status => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;

  /// Serializes this UserFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserFilterCopyWith<UserFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFilterCopyWith<$Res> {
  factory $UserFilterCopyWith(
    UserFilter value,
    $Res Function(UserFilter) then,
  ) = _$UserFilterCopyWithImpl<$Res, UserFilter>;
  @useResult
  $Res call({
    Role? role,
    String? query,
    EnumStatus? status,
    int page,
    int size,
  });
}

/// @nodoc
class _$UserFilterCopyWithImpl<$Res, $Val extends UserFilter>
    implements $UserFilterCopyWith<$Res> {
  _$UserFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? query = freezed,
    Object? status = freezed,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(
      _value.copyWith(
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as Role?,
            query: freezed == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as EnumStatus?,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserFilterImplCopyWith<$Res>
    implements $UserFilterCopyWith<$Res> {
  factory _$$UserFilterImplCopyWith(
    _$UserFilterImpl value,
    $Res Function(_$UserFilterImpl) then,
  ) = __$$UserFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Role? role,
    String? query,
    EnumStatus? status,
    int page,
    int size,
  });
}

/// @nodoc
class __$$UserFilterImplCopyWithImpl<$Res>
    extends _$UserFilterCopyWithImpl<$Res, _$UserFilterImpl>
    implements _$$UserFilterImplCopyWith<$Res> {
  __$$UserFilterImplCopyWithImpl(
    _$UserFilterImpl _value,
    $Res Function(_$UserFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? query = freezed,
    Object? status = freezed,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(
      _$UserFilterImpl(
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as Role?,
        query: freezed == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as EnumStatus?,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFilterImpl implements _UserFilter {
  const _$UserFilterImpl({
    this.role,
    this.query,
    this.status,
    this.page = 0,
    this.size = 10,
  });

  factory _$UserFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFilterImplFromJson(json);

  @override
  final Role? role;
  @override
  final String? query;
  @override
  final EnumStatus? status;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;

  @override
  String toString() {
    return 'UserFilter(role: $role, query: $query, status: $status, page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFilterImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, query, status, page, size);

  /// Create a copy of UserFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFilterImplCopyWith<_$UserFilterImpl> get copyWith =>
      __$$UserFilterImplCopyWithImpl<_$UserFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFilterImplToJson(this);
  }
}

abstract class _UserFilter implements UserFilter {
  const factory _UserFilter({
    final Role? role,
    final String? query,
    final EnumStatus? status,
    final int page,
    final int size,
  }) = _$UserFilterImpl;

  factory _UserFilter.fromJson(Map<String, dynamic> json) =
      _$UserFilterImpl.fromJson;

  @override
  Role? get role;
  @override
  String? get query;
  @override
  EnumStatus? get status;
  @override
  int get page;
  @override
  int get size;

  /// Create a copy of UserFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserFilterImplCopyWith<_$UserFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FileRequest {
  Uint8List? get file => throw _privateConstructorUsedError;
  String? get fileName => throw _privateConstructorUsedError;

  /// Create a copy of FileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileRequestCopyWith<FileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileRequestCopyWith<$Res> {
  factory $FileRequestCopyWith(
    FileRequest value,
    $Res Function(FileRequest) then,
  ) = _$FileRequestCopyWithImpl<$Res, FileRequest>;
  @useResult
  $Res call({Uint8List? file, String? fileName});
}

/// @nodoc
class _$FileRequestCopyWithImpl<$Res, $Val extends FileRequest>
    implements $FileRequestCopyWith<$Res> {
  _$FileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? file = freezed, Object? fileName = freezed}) {
    return _then(
      _value.copyWith(
            file: freezed == file
                ? _value.file
                : file // ignore: cast_nullable_to_non_nullable
                      as Uint8List?,
            fileName: freezed == fileName
                ? _value.fileName
                : fileName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FileRequestImplCopyWith<$Res>
    implements $FileRequestCopyWith<$Res> {
  factory _$$FileRequestImplCopyWith(
    _$FileRequestImpl value,
    $Res Function(_$FileRequestImpl) then,
  ) = __$$FileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List? file, String? fileName});
}

/// @nodoc
class __$$FileRequestImplCopyWithImpl<$Res>
    extends _$FileRequestCopyWithImpl<$Res, _$FileRequestImpl>
    implements _$$FileRequestImplCopyWith<$Res> {
  __$$FileRequestImplCopyWithImpl(
    _$FileRequestImpl _value,
    $Res Function(_$FileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? file = freezed, Object? fileName = freezed}) {
    return _then(
      _$FileRequestImpl(
        file: freezed == file
            ? _value.file
            : file // ignore: cast_nullable_to_non_nullable
                  as Uint8List?,
        fileName: freezed == fileName
            ? _value.fileName
            : fileName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$FileRequestImpl implements _FileRequest {
  const _$FileRequestImpl({required this.file, required this.fileName});

  @override
  final Uint8List? file;
  @override
  final String? fileName;

  @override
  String toString() {
    return 'FileRequest(file: $file, fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileRequestImpl &&
            const DeepCollectionEquality().equals(other.file, file) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(file),
    fileName,
  );

  /// Create a copy of FileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileRequestImplCopyWith<_$FileRequestImpl> get copyWith =>
      __$$FileRequestImplCopyWithImpl<_$FileRequestImpl>(this, _$identity);
}

abstract class _FileRequest implements FileRequest {
  const factory _FileRequest({
    required final Uint8List? file,
    required final String? fileName,
  }) = _$FileRequestImpl;

  @override
  Uint8List? get file;
  @override
  String? get fileName;

  /// Create a copy of FileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileRequestImplCopyWith<_$FileRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FilePayload<T> {
  T get request => throw _privateConstructorUsedError;
  FileRequest get file => throw _privateConstructorUsedError;

  /// Create a copy of FilePayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilePayloadCopyWith<T, FilePayload<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilePayloadCopyWith<T, $Res> {
  factory $FilePayloadCopyWith(
    FilePayload<T> value,
    $Res Function(FilePayload<T>) then,
  ) = _$FilePayloadCopyWithImpl<T, $Res, FilePayload<T>>;
  @useResult
  $Res call({T request, FileRequest file});

  $FileRequestCopyWith<$Res> get file;
}

/// @nodoc
class _$FilePayloadCopyWithImpl<T, $Res, $Val extends FilePayload<T>>
    implements $FilePayloadCopyWith<T, $Res> {
  _$FilePayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilePayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? request = freezed, Object? file = null}) {
    return _then(
      _value.copyWith(
            request: freezed == request
                ? _value.request
                : request // ignore: cast_nullable_to_non_nullable
                      as T,
            file: null == file
                ? _value.file
                : file // ignore: cast_nullable_to_non_nullable
                      as FileRequest,
          )
          as $Val,
    );
  }

  /// Create a copy of FilePayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileRequestCopyWith<$Res> get file {
    return $FileRequestCopyWith<$Res>(_value.file, (value) {
      return _then(_value.copyWith(file: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FilePayloadImplCopyWith<T, $Res>
    implements $FilePayloadCopyWith<T, $Res> {
  factory _$$FilePayloadImplCopyWith(
    _$FilePayloadImpl<T> value,
    $Res Function(_$FilePayloadImpl<T>) then,
  ) = __$$FilePayloadImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T request, FileRequest file});

  @override
  $FileRequestCopyWith<$Res> get file;
}

/// @nodoc
class __$$FilePayloadImplCopyWithImpl<T, $Res>
    extends _$FilePayloadCopyWithImpl<T, $Res, _$FilePayloadImpl<T>>
    implements _$$FilePayloadImplCopyWith<T, $Res> {
  __$$FilePayloadImplCopyWithImpl(
    _$FilePayloadImpl<T> _value,
    $Res Function(_$FilePayloadImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of FilePayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? request = freezed, Object? file = null}) {
    return _then(
      _$FilePayloadImpl<T>(
        request: freezed == request
            ? _value.request
            : request // ignore: cast_nullable_to_non_nullable
                  as T,
        file: null == file
            ? _value.file
            : file // ignore: cast_nullable_to_non_nullable
                  as FileRequest,
      ),
    );
  }
}

/// @nodoc

class _$FilePayloadImpl<T> implements _FilePayload<T> {
  const _$FilePayloadImpl({required this.request, required this.file});

  @override
  final T request;
  @override
  final FileRequest file;

  @override
  String toString() {
    return 'FilePayload<$T>(request: $request, file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilePayloadImpl<T> &&
            const DeepCollectionEquality().equals(other.request, request) &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(request),
    file,
  );

  /// Create a copy of FilePayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilePayloadImplCopyWith<T, _$FilePayloadImpl<T>> get copyWith =>
      __$$FilePayloadImplCopyWithImpl<T, _$FilePayloadImpl<T>>(
        this,
        _$identity,
      );
}

abstract class _FilePayload<T> implements FilePayload<T> {
  const factory _FilePayload({
    required final T request,
    required final FileRequest file,
  }) = _$FilePayloadImpl<T>;

  @override
  T get request;
  @override
  FileRequest get file;

  /// Create a copy of FilePayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilePayloadImplCopyWith<T, _$FilePayloadImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FilePayloadUpdate<T> {
  int get id => throw _privateConstructorUsedError;
  T get request => throw _privateConstructorUsedError;
  FileRequest get file => throw _privateConstructorUsedError;

  /// Create a copy of FilePayloadUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilePayloadUpdateCopyWith<T, FilePayloadUpdate<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilePayloadUpdateCopyWith<T, $Res> {
  factory $FilePayloadUpdateCopyWith(
    FilePayloadUpdate<T> value,
    $Res Function(FilePayloadUpdate<T>) then,
  ) = _$FilePayloadUpdateCopyWithImpl<T, $Res, FilePayloadUpdate<T>>;
  @useResult
  $Res call({int id, T request, FileRequest file});

  $FileRequestCopyWith<$Res> get file;
}

/// @nodoc
class _$FilePayloadUpdateCopyWithImpl<
  T,
  $Res,
  $Val extends FilePayloadUpdate<T>
>
    implements $FilePayloadUpdateCopyWith<T, $Res> {
  _$FilePayloadUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilePayloadUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = freezed,
    Object? file = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            request: freezed == request
                ? _value.request
                : request // ignore: cast_nullable_to_non_nullable
                      as T,
            file: null == file
                ? _value.file
                : file // ignore: cast_nullable_to_non_nullable
                      as FileRequest,
          )
          as $Val,
    );
  }

  /// Create a copy of FilePayloadUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileRequestCopyWith<$Res> get file {
    return $FileRequestCopyWith<$Res>(_value.file, (value) {
      return _then(_value.copyWith(file: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FilePayloadUpdateImplCopyWith<T, $Res>
    implements $FilePayloadUpdateCopyWith<T, $Res> {
  factory _$$FilePayloadUpdateImplCopyWith(
    _$FilePayloadUpdateImpl<T> value,
    $Res Function(_$FilePayloadUpdateImpl<T>) then,
  ) = __$$FilePayloadUpdateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int id, T request, FileRequest file});

  @override
  $FileRequestCopyWith<$Res> get file;
}

/// @nodoc
class __$$FilePayloadUpdateImplCopyWithImpl<T, $Res>
    extends _$FilePayloadUpdateCopyWithImpl<T, $Res, _$FilePayloadUpdateImpl<T>>
    implements _$$FilePayloadUpdateImplCopyWith<T, $Res> {
  __$$FilePayloadUpdateImplCopyWithImpl(
    _$FilePayloadUpdateImpl<T> _value,
    $Res Function(_$FilePayloadUpdateImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of FilePayloadUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = freezed,
    Object? file = null,
  }) {
    return _then(
      _$FilePayloadUpdateImpl<T>(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        request: freezed == request
            ? _value.request
            : request // ignore: cast_nullable_to_non_nullable
                  as T,
        file: null == file
            ? _value.file
            : file // ignore: cast_nullable_to_non_nullable
                  as FileRequest,
      ),
    );
  }
}

/// @nodoc

class _$FilePayloadUpdateImpl<T> implements _FilePayloadUpdate<T> {
  const _$FilePayloadUpdateImpl({
    required this.id,
    required this.request,
    required this.file,
  });

  @override
  final int id;
  @override
  final T request;
  @override
  final FileRequest file;

  @override
  String toString() {
    return 'FilePayloadUpdate<$T>(id: $id, request: $request, file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilePayloadUpdateImpl<T> &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.request, request) &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(request),
    file,
  );

  /// Create a copy of FilePayloadUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilePayloadUpdateImplCopyWith<T, _$FilePayloadUpdateImpl<T>>
  get copyWith =>
      __$$FilePayloadUpdateImplCopyWithImpl<T, _$FilePayloadUpdateImpl<T>>(
        this,
        _$identity,
      );
}

abstract class _FilePayloadUpdate<T> implements FilePayloadUpdate<T> {
  const factory _FilePayloadUpdate({
    required final int id,
    required final T request,
    required final FileRequest file,
  }) = _$FilePayloadUpdateImpl<T>;

  @override
  int get id;
  @override
  T get request;
  @override
  FileRequest get file;

  /// Create a copy of FilePayloadUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilePayloadUpdateImplCopyWith<T, _$FilePayloadUpdateImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

CreateSuspectRequest _$CreateSuspectRequestFromJson(Map<String, dynamic> json) {
  return _CreateSuspectRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateSuspectRequest {
  String get name => throw _privateConstructorUsedError;
  @DateOnlyConverter()
  DateTime get birthDate => throw _privateConstructorUsedError;
  String get cpf => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this CreateSuspectRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSuspectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSuspectRequestCopyWith<CreateSuspectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSuspectRequestCopyWith<$Res> {
  factory $CreateSuspectRequestCopyWith(
    CreateSuspectRequest value,
    $Res Function(CreateSuspectRequest) then,
  ) = _$CreateSuspectRequestCopyWithImpl<$Res, CreateSuspectRequest>;
  @useResult
  $Res call({
    String name,
    @DateOnlyConverter() DateTime birthDate,
    String cpf,
    String description,
  });
}

/// @nodoc
class _$CreateSuspectRequestCopyWithImpl<
  $Res,
  $Val extends CreateSuspectRequest
>
    implements $CreateSuspectRequestCopyWith<$Res> {
  _$CreateSuspectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSuspectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDate = null,
    Object? cpf = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            birthDate: null == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            cpf: null == cpf
                ? _value.cpf
                : cpf // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateSuspectRequestImplCopyWith<$Res>
    implements $CreateSuspectRequestCopyWith<$Res> {
  factory _$$CreateSuspectRequestImplCopyWith(
    _$CreateSuspectRequestImpl value,
    $Res Function(_$CreateSuspectRequestImpl) then,
  ) = __$$CreateSuspectRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    @DateOnlyConverter() DateTime birthDate,
    String cpf,
    String description,
  });
}

/// @nodoc
class __$$CreateSuspectRequestImplCopyWithImpl<$Res>
    extends _$CreateSuspectRequestCopyWithImpl<$Res, _$CreateSuspectRequestImpl>
    implements _$$CreateSuspectRequestImplCopyWith<$Res> {
  __$$CreateSuspectRequestImplCopyWithImpl(
    _$CreateSuspectRequestImpl _value,
    $Res Function(_$CreateSuspectRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateSuspectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDate = null,
    Object? cpf = null,
    Object? description = null,
  }) {
    return _then(
      _$CreateSuspectRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        birthDate: null == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        cpf: null == cpf
            ? _value.cpf
            : cpf // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSuspectRequestImpl implements _CreateSuspectRequest {
  const _$CreateSuspectRequestImpl({
    required this.name,
    @DateOnlyConverter() required this.birthDate,
    required this.cpf,
    required this.description,
  });

  factory _$CreateSuspectRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateSuspectRequestImplFromJson(json);

  @override
  final String name;
  @override
  @DateOnlyConverter()
  final DateTime birthDate;
  @override
  final String cpf;
  @override
  final String description;

  @override
  String toString() {
    return 'CreateSuspectRequest(name: $name, birthDate: $birthDate, cpf: $cpf, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSuspectRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.cpf, cpf) || other.cpf == cpf) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, birthDate, cpf, description);

  /// Create a copy of CreateSuspectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSuspectRequestImplCopyWith<_$CreateSuspectRequestImpl>
  get copyWith =>
      __$$CreateSuspectRequestImplCopyWithImpl<_$CreateSuspectRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSuspectRequestImplToJson(this);
  }
}

abstract class _CreateSuspectRequest implements CreateSuspectRequest {
  const factory _CreateSuspectRequest({
    required final String name,
    @DateOnlyConverter() required final DateTime birthDate,
    required final String cpf,
    required final String description,
  }) = _$CreateSuspectRequestImpl;

  factory _CreateSuspectRequest.fromJson(Map<String, dynamic> json) =
      _$CreateSuspectRequestImpl.fromJson;

  @override
  String get name;
  @override
  @DateOnlyConverter()
  DateTime get birthDate;
  @override
  String get cpf;
  @override
  String get description;

  /// Create a copy of CreateSuspectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSuspectRequestImplCopyWith<_$CreateSuspectRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UpdateSuspectRequest _$UpdateSuspectRequestFromJson(Map<String, dynamic> json) {
  return _UpdateSuspectRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateSuspectRequest {
  String get name => throw _privateConstructorUsedError;
  @DateOnlyConverter()
  DateTime get birthDate => throw _privateConstructorUsedError;
  String get cpf => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  SuspectStatus get suspectStatus => throw _privateConstructorUsedError;

  /// Serializes this UpdateSuspectRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateSuspectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateSuspectRequestCopyWith<UpdateSuspectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSuspectRequestCopyWith<$Res> {
  factory $UpdateSuspectRequestCopyWith(
    UpdateSuspectRequest value,
    $Res Function(UpdateSuspectRequest) then,
  ) = _$UpdateSuspectRequestCopyWithImpl<$Res, UpdateSuspectRequest>;
  @useResult
  $Res call({
    String name,
    @DateOnlyConverter() DateTime birthDate,
    String cpf,
    String description,
    SuspectStatus suspectStatus,
  });
}

/// @nodoc
class _$UpdateSuspectRequestCopyWithImpl<
  $Res,
  $Val extends UpdateSuspectRequest
>
    implements $UpdateSuspectRequestCopyWith<$Res> {
  _$UpdateSuspectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateSuspectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDate = null,
    Object? cpf = null,
    Object? description = null,
    Object? suspectStatus = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            birthDate: null == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            cpf: null == cpf
                ? _value.cpf
                : cpf // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            suspectStatus: null == suspectStatus
                ? _value.suspectStatus
                : suspectStatus // ignore: cast_nullable_to_non_nullable
                      as SuspectStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateSuspectRequestImplCopyWith<$Res>
    implements $UpdateSuspectRequestCopyWith<$Res> {
  factory _$$UpdateSuspectRequestImplCopyWith(
    _$UpdateSuspectRequestImpl value,
    $Res Function(_$UpdateSuspectRequestImpl) then,
  ) = __$$UpdateSuspectRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    @DateOnlyConverter() DateTime birthDate,
    String cpf,
    String description,
    SuspectStatus suspectStatus,
  });
}

/// @nodoc
class __$$UpdateSuspectRequestImplCopyWithImpl<$Res>
    extends _$UpdateSuspectRequestCopyWithImpl<$Res, _$UpdateSuspectRequestImpl>
    implements _$$UpdateSuspectRequestImplCopyWith<$Res> {
  __$$UpdateSuspectRequestImplCopyWithImpl(
    _$UpdateSuspectRequestImpl _value,
    $Res Function(_$UpdateSuspectRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateSuspectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? birthDate = null,
    Object? cpf = null,
    Object? description = null,
    Object? suspectStatus = null,
  }) {
    return _then(
      _$UpdateSuspectRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        birthDate: null == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        cpf: null == cpf
            ? _value.cpf
            : cpf // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        suspectStatus: null == suspectStatus
            ? _value.suspectStatus
            : suspectStatus // ignore: cast_nullable_to_non_nullable
                  as SuspectStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateSuspectRequestImpl implements _UpdateSuspectRequest {
  const _$UpdateSuspectRequestImpl({
    required this.name,
    @DateOnlyConverter() required this.birthDate,
    required this.cpf,
    required this.description,
    required this.suspectStatus,
  });

  factory _$UpdateSuspectRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateSuspectRequestImplFromJson(json);

  @override
  final String name;
  @override
  @DateOnlyConverter()
  final DateTime birthDate;
  @override
  final String cpf;
  @override
  final String description;
  @override
  final SuspectStatus suspectStatus;

  @override
  String toString() {
    return 'UpdateSuspectRequest(name: $name, birthDate: $birthDate, cpf: $cpf, description: $description, suspectStatus: $suspectStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSuspectRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.cpf, cpf) || other.cpf == cpf) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.suspectStatus, suspectStatus) ||
                other.suspectStatus == suspectStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    birthDate,
    cpf,
    description,
    suspectStatus,
  );

  /// Create a copy of UpdateSuspectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSuspectRequestImplCopyWith<_$UpdateSuspectRequestImpl>
  get copyWith =>
      __$$UpdateSuspectRequestImplCopyWithImpl<_$UpdateSuspectRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateSuspectRequestImplToJson(this);
  }
}

abstract class _UpdateSuspectRequest implements UpdateSuspectRequest {
  const factory _UpdateSuspectRequest({
    required final String name,
    @DateOnlyConverter() required final DateTime birthDate,
    required final String cpf,
    required final String description,
    required final SuspectStatus suspectStatus,
  }) = _$UpdateSuspectRequestImpl;

  factory _UpdateSuspectRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateSuspectRequestImpl.fromJson;

  @override
  String get name;
  @override
  @DateOnlyConverter()
  DateTime get birthDate;
  @override
  String get cpf;
  @override
  String get description;
  @override
  SuspectStatus get suspectStatus;

  /// Create a copy of UpdateSuspectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSuspectRequestImplCopyWith<_$UpdateSuspectRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SuspectFilter _$SuspectFilterFromJson(Map<String, dynamic> json) {
  return _SuspectFilter.fromJson(json);
}

/// @nodoc
mixin _$SuspectFilter {
  String? get query => throw _privateConstructorUsedError;
  SuspectStatus? get status => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;

  /// Serializes this SuspectFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuspectFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuspectFilterCopyWith<SuspectFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuspectFilterCopyWith<$Res> {
  factory $SuspectFilterCopyWith(
    SuspectFilter value,
    $Res Function(SuspectFilter) then,
  ) = _$SuspectFilterCopyWithImpl<$Res, SuspectFilter>;
  @useResult
  $Res call({String? query, SuspectStatus? status, int page, int size});
}

/// @nodoc
class _$SuspectFilterCopyWithImpl<$Res, $Val extends SuspectFilter>
    implements $SuspectFilterCopyWith<$Res> {
  _$SuspectFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuspectFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? status = freezed,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(
      _value.copyWith(
            query: freezed == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as SuspectStatus?,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SuspectFilterImplCopyWith<$Res>
    implements $SuspectFilterCopyWith<$Res> {
  factory _$$SuspectFilterImplCopyWith(
    _$SuspectFilterImpl value,
    $Res Function(_$SuspectFilterImpl) then,
  ) = __$$SuspectFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? query, SuspectStatus? status, int page, int size});
}

/// @nodoc
class __$$SuspectFilterImplCopyWithImpl<$Res>
    extends _$SuspectFilterCopyWithImpl<$Res, _$SuspectFilterImpl>
    implements _$$SuspectFilterImplCopyWith<$Res> {
  __$$SuspectFilterImplCopyWithImpl(
    _$SuspectFilterImpl _value,
    $Res Function(_$SuspectFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SuspectFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? status = freezed,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(
      _$SuspectFilterImpl(
        query: freezed == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SuspectStatus?,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SuspectFilterImpl implements _SuspectFilter {
  const _$SuspectFilterImpl({
    this.query,
    this.status,
    this.page = 0,
    this.size = 10,
  });

  factory _$SuspectFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuspectFilterImplFromJson(json);

  @override
  final String? query;
  @override
  final SuspectStatus? status;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;

  @override
  String toString() {
    return 'SuspectFilter(query: $query, status: $status, page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuspectFilterImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, query, status, page, size);

  /// Create a copy of SuspectFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuspectFilterImplCopyWith<_$SuspectFilterImpl> get copyWith =>
      __$$SuspectFilterImplCopyWithImpl<_$SuspectFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuspectFilterImplToJson(this);
  }
}

abstract class _SuspectFilter implements SuspectFilter {
  const factory _SuspectFilter({
    final String? query,
    final SuspectStatus? status,
    final int page,
    final int size,
  }) = _$SuspectFilterImpl;

  factory _SuspectFilter.fromJson(Map<String, dynamic> json) =
      _$SuspectFilterImpl.fromJson;

  @override
  String? get query;
  @override
  SuspectStatus? get status;
  @override
  int get page;
  @override
  int get size;

  /// Create a copy of SuspectFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuspectFilterImplCopyWith<_$SuspectFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
