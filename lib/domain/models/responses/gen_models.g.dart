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
      provider: $enumDecode(_$AuthProviderEnumMap, json['provider']),
      enabled: json['enabled'] as bool,
      locked: json['locked'] as bool,
      profileImageUrl: json['profileImageUrl'] as String?,
      status: $enumDecode(_$EnumStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': _$RoleEnumMap[instance.role]!,
      'provider': _$AuthProviderEnumMap[instance.provider]!,
      'enabled': instance.enabled,
      'locked': instance.locked,
      'profileImageUrl': instance.profileImageUrl,
      'status': _$EnumStatusEnumMap[instance.status]!,
    };

const _$RoleEnumMap = {Role.ADMIN: 'ADMIN', Role.SECURITY: 'SECURITY'};

const _$AuthProviderEnumMap = {
  AuthProvider.LOCAL: 'LOCAL',
  AuthProvider.GOOGLE: 'GOOGLE',
};

const _$EnumStatusEnumMap = {
  EnumStatus.ATIVO: 'ATIVO',
  EnumStatus.INATIVO: 'INATIVO',
  EnumStatus.BLOQUEADO: 'BLOQUEADO',
};

_$AuthTokensImpl _$$AuthTokensImplFromJson(Map<String, dynamic> json) =>
    _$AuthTokensImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      mustChangePassword: json['mustChangePassword'] as bool,
    );

Map<String, dynamic> _$$AuthTokensImplToJson(_$AuthTokensImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
      'mustChangePassword': instance.mustChangePassword,
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

_$PaginatedResponseImpl<T> _$$PaginatedResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$PaginatedResponseImpl<T>(
  content: (json['content'] as List<dynamic>).map(fromJsonT).toList(),
  totalPages: (json['totalPages'] as num).toInt(),
  totalElements: (json['totalElements'] as num).toInt(),
  size: (json['size'] as num).toInt(),
  number: (json['number'] as num).toInt(),
);

Map<String, dynamic> _$$PaginatedResponseImplToJson<T>(
  _$PaginatedResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'content': instance.content.map(toJsonT).toList(),
  'totalPages': instance.totalPages,
  'totalElements': instance.totalElements,
  'size': instance.size,
  'number': instance.number,
};

_$SuspectResponseImpl _$$SuspectResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SuspectResponseImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  birthDate: const DateOnlyConverter().fromJson(json['birthDate'] as String),
  cpf: json['cpf'] as String,
  description: json['description'] as String,
  images: (json['images'] as List<dynamic>)
      .map((e) => ImageResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  suspectStatus: $enumDecode(_$SuspectStatusEnumMap, json['suspectStatus']),
);

Map<String, dynamic> _$$SuspectResponseImplToJson(
  _$SuspectResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'birthDate': const DateOnlyConverter().toJson(instance.birthDate),
  'cpf': instance.cpf,
  'description': instance.description,
  'images': instance.images,
  'suspectStatus': _$SuspectStatusEnumMap[instance.suspectStatus]!,
};

const _$SuspectStatusEnumMap = {
  SuspectStatus.FORAGIDO: 'FORAGIDO',
  SuspectStatus.CAPTURADO: 'CAPTURADO',
};

_$IncidentResponseImpl _$$IncidentResponseImplFromJson(
  Map<String, dynamic> json,
) => _$IncidentResponseImpl(
  id: (json['id'] as num).toInt(),
  suspect: SuspectResponse.fromJson(json['suspect'] as Map<String, dynamic>),
  imageUrl: json['imageUrl'] as String?,
  score: (json['score'] as num?)?.toDouble(),
  location: json['location'] as String?,
  incidentStatus: $enumDecodeNullable(
    _$IncidentStatusEnumMap,
    json['incidentStatus'],
  ),
  assignedUser: json['assignedUser'] == null
      ? null
      : UserResponse.fromJson(json['assignedUser'] as Map<String, dynamic>),
  notes: json['notes'] as String?,
  processedUrl: json['processedUrl'] as String?,
  createdAt: const DateOnlyConverter().fromJson(json['createdAt'] as String),
  updatedAt: _$JsonConverterFromJson<String, DateTime>(
    json['updatedAt'],
    const DateOnlyConverter().fromJson,
  ),
);

Map<String, dynamic> _$$IncidentResponseImplToJson(
  _$IncidentResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'suspect': instance.suspect,
  'imageUrl': instance.imageUrl,
  'score': instance.score,
  'location': instance.location,
  'incidentStatus': _$IncidentStatusEnumMap[instance.incidentStatus],
  'assignedUser': instance.assignedUser,
  'notes': instance.notes,
  'processedUrl': instance.processedUrl,
  'createdAt': const DateOnlyConverter().toJson(instance.createdAt),
  'updatedAt': _$JsonConverterToJson<String, DateTime>(
    instance.updatedAt,
    const DateOnlyConverter().toJson,
  ),
};

const _$IncidentStatusEnumMap = {
  IncidentStatus.POSITIVO: 'POSITIVO',
  IncidentStatus.FALSO_POSITIVO: 'FALSO_POSITIVO',
  IncidentStatus.ABERTO: 'ABERTO',
  IncidentStatus.EM_PROCESSAMENTO: 'EM_PROCESSAMENTO',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_$UpdateIncidentRequestImpl _$$UpdateIncidentRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateIncidentRequestImpl(
  location: json['location'] as String?,
  incidentStatus: $enumDecodeNullable(
    _$IncidentStatusEnumMap,
    json['incidentStatus'],
  ),
  assignedUserId: (json['assignedUserId'] as num?)?.toInt(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$UpdateIncidentRequestImplToJson(
  _$UpdateIncidentRequestImpl instance,
) => <String, dynamic>{
  'location': instance.location,
  'incidentStatus': _$IncidentStatusEnumMap[instance.incidentStatus],
  'assignedUserId': instance.assignedUserId,
  'notes': instance.notes,
};
