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

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UserResponse.fromJson(json);
}

/// @nodoc
mixin _$UserResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  bool get locked => throw _privateConstructorUsedError;

  /// Serializes this UserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserResponseCopyWith<UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
    UserResponse value,
    $Res Function(UserResponse) then,
  ) = _$UserResponseCopyWithImpl<$Res, UserResponse>;
  @useResult
  $Res call({
    int id,
    String name,
    String email,
    Role role,
    bool enabled,
    bool locked,
  });
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res, $Val extends UserResponse>
    implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? enabled = null,
    Object? locked = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
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
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            locked: null == locked
                ? _value.locked
                : locked // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserResponseImplCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$$UserResponseImplCopyWith(
    _$UserResponseImpl value,
    $Res Function(_$UserResponseImpl) then,
  ) = __$$UserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String email,
    Role role,
    bool enabled,
    bool locked,
  });
}

/// @nodoc
class __$$UserResponseImplCopyWithImpl<$Res>
    extends _$UserResponseCopyWithImpl<$Res, _$UserResponseImpl>
    implements _$$UserResponseImplCopyWith<$Res> {
  __$$UserResponseImplCopyWithImpl(
    _$UserResponseImpl _value,
    $Res Function(_$UserResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? enabled = null,
    Object? locked = null,
  }) {
    return _then(
      _$UserResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
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
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        locked: null == locked
            ? _value.locked
            : locked // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseImpl implements _UserResponse {
  const _$UserResponseImpl({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.enabled,
    required this.locked,
  });

  factory _$UserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final Role role;
  @override
  final bool enabled;
  @override
  final bool locked;

  @override
  String toString() {
    return 'UserResponse(id: $id, name: $name, email: $email, role: $role, enabled: $enabled, locked: $locked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.locked, locked) || other.locked == locked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, email, role, enabled, locked);

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      __$$UserResponseImplCopyWithImpl<_$UserResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseImplToJson(this);
  }
}

abstract class _UserResponse implements UserResponse {
  const factory _UserResponse({
    required final int id,
    required final String name,
    required final String email,
    required final Role role,
    required final bool enabled,
    required final bool locked,
  }) = _$UserResponseImpl;

  factory _UserResponse.fromJson(Map<String, dynamic> json) =
      _$UserResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  Role get role;
  @override
  bool get enabled;
  @override
  bool get locked;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthTokens _$AuthTokensFromJson(Map<String, dynamic> json) {
  return _AuthTokens.fromJson(json);
}

/// @nodoc
mixin _$AuthTokens {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  UserResponse get user => throw _privateConstructorUsedError;

  /// Serializes this AuthTokens to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthTokensCopyWith<AuthTokens> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokensCopyWith<$Res> {
  factory $AuthTokensCopyWith(
    AuthTokens value,
    $Res Function(AuthTokens) then,
  ) = _$AuthTokensCopyWithImpl<$Res, AuthTokens>;
  @useResult
  $Res call({String accessToken, String refreshToken, UserResponse user});

  $UserResponseCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthTokensCopyWithImpl<$Res, $Val extends AuthTokens>
    implements $AuthTokensCopyWith<$Res> {
  _$AuthTokensCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? user = null,
  }) {
    return _then(
      _value.copyWith(
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            refreshToken: null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserResponse,
          )
          as $Val,
    );
  }

  /// Create a copy of AuthTokens
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<$Res> get user {
    return $UserResponseCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthTokensImplCopyWith<$Res>
    implements $AuthTokensCopyWith<$Res> {
  factory _$$AuthTokensImplCopyWith(
    _$AuthTokensImpl value,
    $Res Function(_$AuthTokensImpl) then,
  ) = __$$AuthTokensImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken, UserResponse user});

  @override
  $UserResponseCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthTokensImplCopyWithImpl<$Res>
    extends _$AuthTokensCopyWithImpl<$Res, _$AuthTokensImpl>
    implements _$$AuthTokensImplCopyWith<$Res> {
  __$$AuthTokensImplCopyWithImpl(
    _$AuthTokensImpl _value,
    $Res Function(_$AuthTokensImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthTokens
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? user = null,
  }) {
    return _then(
      _$AuthTokensImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        refreshToken: null == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserResponse,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthTokensImpl implements _AuthTokens {
  const _$AuthTokensImpl({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory _$AuthTokensImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthTokensImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final UserResponse user;

  @override
  String toString() {
    return 'AuthTokens(accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokensImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken, user);

  /// Create a copy of AuthTokens
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthTokensImplCopyWith<_$AuthTokensImpl> get copyWith =>
      __$$AuthTokensImplCopyWithImpl<_$AuthTokensImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthTokensImplToJson(this);
  }
}

abstract class _AuthTokens implements AuthTokens {
  const factory _AuthTokens({
    required final String accessToken,
    required final String refreshToken,
    required final UserResponse user,
  }) = _$AuthTokensImpl;

  factory _AuthTokens.fromJson(Map<String, dynamic> json) =
      _$AuthTokensImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  UserResponse get user;

  /// Create a copy of AuthTokens
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthTokensImplCopyWith<_$AuthTokensImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmergencyContactsResponse _$EmergencyContactsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _EmeregencyContactResponse.fromJson(json);
}

/// @nodoc
mixin _$EmergencyContactsResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  ServiceType get serviceType => throw _privateConstructorUsedError;
  List<ImageResponse> get images => throw _privateConstructorUsedError;

  /// Serializes this EmergencyContactsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmergencyContactsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmergencyContactsResponseCopyWith<EmergencyContactsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyContactsResponseCopyWith<$Res> {
  factory $EmergencyContactsResponseCopyWith(
    EmergencyContactsResponse value,
    $Res Function(EmergencyContactsResponse) then,
  ) = _$EmergencyContactsResponseCopyWithImpl<$Res, EmergencyContactsResponse>;
  @useResult
  $Res call({
    int id,
    String name,
    String phone,
    ServiceType serviceType,
    List<ImageResponse> images,
  });
}

/// @nodoc
class _$EmergencyContactsResponseCopyWithImpl<
  $Res,
  $Val extends EmergencyContactsResponse
>
    implements $EmergencyContactsResponseCopyWith<$Res> {
  _$EmergencyContactsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmergencyContactsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? serviceType = null,
    Object? images = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
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
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<ImageResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmeregencyContactResponseImplCopyWith<$Res>
    implements $EmergencyContactsResponseCopyWith<$Res> {
  factory _$$EmeregencyContactResponseImplCopyWith(
    _$EmeregencyContactResponseImpl value,
    $Res Function(_$EmeregencyContactResponseImpl) then,
  ) = __$$EmeregencyContactResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String phone,
    ServiceType serviceType,
    List<ImageResponse> images,
  });
}

/// @nodoc
class __$$EmeregencyContactResponseImplCopyWithImpl<$Res>
    extends
        _$EmergencyContactsResponseCopyWithImpl<
          $Res,
          _$EmeregencyContactResponseImpl
        >
    implements _$$EmeregencyContactResponseImplCopyWith<$Res> {
  __$$EmeregencyContactResponseImplCopyWithImpl(
    _$EmeregencyContactResponseImpl _value,
    $Res Function(_$EmeregencyContactResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmergencyContactsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? serviceType = null,
    Object? images = null,
  }) {
    return _then(
      _$EmeregencyContactResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
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
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<ImageResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmeregencyContactResponseImpl implements _EmeregencyContactResponse {
  const _$EmeregencyContactResponseImpl({
    required this.id,
    required this.name,
    required this.phone,
    required this.serviceType,
    required final List<ImageResponse> images,
  }) : _images = images;

  factory _$EmeregencyContactResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmeregencyContactResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final ServiceType serviceType;
  final List<ImageResponse> _images;
  @override
  List<ImageResponse> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'EmergencyContactsResponse(id: $id, name: $name, phone: $phone, serviceType: $serviceType, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmeregencyContactResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    phone,
    serviceType,
    const DeepCollectionEquality().hash(_images),
  );

  /// Create a copy of EmergencyContactsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmeregencyContactResponseImplCopyWith<_$EmeregencyContactResponseImpl>
  get copyWith =>
      __$$EmeregencyContactResponseImplCopyWithImpl<
        _$EmeregencyContactResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmeregencyContactResponseImplToJson(this);
  }
}

abstract class _EmeregencyContactResponse implements EmergencyContactsResponse {
  const factory _EmeregencyContactResponse({
    required final int id,
    required final String name,
    required final String phone,
    required final ServiceType serviceType,
    required final List<ImageResponse> images,
  }) = _$EmeregencyContactResponseImpl;

  factory _EmeregencyContactResponse.fromJson(Map<String, dynamic> json) =
      _$EmeregencyContactResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  ServiceType get serviceType;
  @override
  List<ImageResponse> get images;

  /// Create a copy of EmergencyContactsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmeregencyContactResponseImplCopyWith<_$EmeregencyContactResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) {
  return _ImageResponse.fromJson(json);
}

/// @nodoc
mixin _$ImageResponse {
  int get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get contentType => throw _privateConstructorUsedError;
  int get sizeBytes => throw _privateConstructorUsedError;

  /// Serializes this ImageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageResponseCopyWith<ImageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageResponseCopyWith<$Res> {
  factory $ImageResponseCopyWith(
    ImageResponse value,
    $Res Function(ImageResponse) then,
  ) = _$ImageResponseCopyWithImpl<$Res, ImageResponse>;
  @useResult
  $Res call({int id, String url, String contentType, int sizeBytes});
}

/// @nodoc
class _$ImageResponseCopyWithImpl<$Res, $Val extends ImageResponse>
    implements $ImageResponseCopyWith<$Res> {
  _$ImageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? contentType = null,
    Object? sizeBytes = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            contentType: null == contentType
                ? _value.contentType
                : contentType // ignore: cast_nullable_to_non_nullable
                      as String,
            sizeBytes: null == sizeBytes
                ? _value.sizeBytes
                : sizeBytes // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImageResponseImplCopyWith<$Res>
    implements $ImageResponseCopyWith<$Res> {
  factory _$$ImageResponseImplCopyWith(
    _$ImageResponseImpl value,
    $Res Function(_$ImageResponseImpl) then,
  ) = __$$ImageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String url, String contentType, int sizeBytes});
}

/// @nodoc
class __$$ImageResponseImplCopyWithImpl<$Res>
    extends _$ImageResponseCopyWithImpl<$Res, _$ImageResponseImpl>
    implements _$$ImageResponseImplCopyWith<$Res> {
  __$$ImageResponseImplCopyWithImpl(
    _$ImageResponseImpl _value,
    $Res Function(_$ImageResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? contentType = null,
    Object? sizeBytes = null,
  }) {
    return _then(
      _$ImageResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        contentType: null == contentType
            ? _value.contentType
            : contentType // ignore: cast_nullable_to_non_nullable
                  as String,
        sizeBytes: null == sizeBytes
            ? _value.sizeBytes
            : sizeBytes // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageResponseImpl implements _ImageResponse {
  const _$ImageResponseImpl({
    required this.id,
    required this.url,
    required this.contentType,
    required this.sizeBytes,
  });

  factory _$ImageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String url;
  @override
  final String contentType;
  @override
  final int sizeBytes;

  @override
  String toString() {
    return 'ImageResponse(id: $id, url: $url, contentType: $contentType, sizeBytes: $sizeBytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, contentType, sizeBytes);

  /// Create a copy of ImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageResponseImplCopyWith<_$ImageResponseImpl> get copyWith =>
      __$$ImageResponseImplCopyWithImpl<_$ImageResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageResponseImplToJson(this);
  }
}

abstract class _ImageResponse implements ImageResponse {
  const factory _ImageResponse({
    required final int id,
    required final String url,
    required final String contentType,
    required final int sizeBytes,
  }) = _$ImageResponseImpl;

  factory _ImageResponse.fromJson(Map<String, dynamic> json) =
      _$ImageResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get url;
  @override
  String get contentType;
  @override
  int get sizeBytes;

  /// Create a copy of ImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageResponseImplCopyWith<_$ImageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
