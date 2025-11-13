// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      enabled: json['enabled'] as bool,
      locked: json['locked'] as bool,
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': _$RoleEnumMap[instance.role]!,
      'enabled': instance.enabled,
      'locked': instance.locked,
    };

const _$RoleEnumMap = {Role.ADMIN: 'ADMIN', Role.SECURITY: 'SECURITY'};

_$AuthTokensImpl _$$AuthTokensImplFromJson(Map<String, dynamic> json) =>
    _$AuthTokensImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthTokensImplToJson(_$AuthTokensImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
    };

_$EmergencyContactResponseImpl _$$EmergencyContactResponseImplFromJson(
  Map<String, dynamic> json,
) => _$EmergencyContactResponseImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String,
  serviceType: $enumDecode(_$ServiceTypeEnumMap, json['serviceType']),
  images: (json['images'] as List<dynamic>)
      .map((e) => ImageResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$EmergencyContactResponseImplToJson(
  _$EmergencyContactResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'serviceType': _$ServiceTypeEnumMap[instance.serviceType]!,
  'images': instance.images,
};

const _$ServiceTypeEnumMap = {
  ServiceType.SAMU: 'SAMU',
  ServiceType.BOMBEIROS: 'BOMBEIROS',
  ServiceType.PM: 'PM',
  ServiceType.OUTRO: 'OUTRO',
};

_$PageResponseImpl<T> _$$PageResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$PageResponseImpl<T>(
  content: (json['content'] as List<dynamic>).map(fromJsonT).toList(),
  totalPages: (json['totalPages'] as num).toInt(),
  totalElements: (json['totalElements'] as num).toInt(),
  size: (json['size'] as num).toInt(),
  number: (json['number'] as num).toInt(),
  last: json['last'] as bool,
  first: json['first'] as bool,
  empty: json['empty'] as bool,
);

Map<String, dynamic> _$$PageResponseImplToJson<T>(
  _$PageResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'content': instance.content.map(toJsonT).toList(),
  'totalPages': instance.totalPages,
  'totalElements': instance.totalElements,
  'size': instance.size,
  'number': instance.number,
  'last': instance.last,
  'first': instance.first,
  'empty': instance.empty,
};

_$ImageResponseImpl _$$ImageResponseImplFromJson(Map<String, dynamic> json) =>
    _$ImageResponseImpl(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      contentType: json['contentType'] as String,
      sizeBytes: (json['sizeBytes'] as num).toInt(),
    );

Map<String, dynamic> _$$ImageResponseImplToJson(_$ImageResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'contentType': instance.contentType,
      'sizeBytes': instance.sizeBytes,
    };
