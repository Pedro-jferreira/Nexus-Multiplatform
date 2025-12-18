// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fcmToken': instance.fcmToken,
    };

_$UpdatePasswordRequestImpl _$$UpdatePasswordRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdatePasswordRequestImpl(
  currentPassword: json['currentPassword'] as String,
  newPassword: json['newPassword'] as String,
  confirmNewPassword: json['confirmNewPassword'] as String,
);

Map<String, dynamic> _$$UpdatePasswordRequestImplToJson(
  _$UpdatePasswordRequestImpl instance,
) => <String, dynamic>{
  'currentPassword': instance.currentPassword,
  'newPassword': instance.newPassword,
  'confirmNewPassword': instance.confirmNewPassword,
};

_$UnlockAccountRequestImpl _$$UnlockAccountRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UnlockAccountRequestImpl(email: json['email'] as String);

Map<String, dynamic> _$$UnlockAccountRequestImplToJson(
  _$UnlockAccountRequestImpl instance,
) => <String, dynamic>{'email': instance.email};

_$CreateEmergencyContactRequestImpl
_$$CreateEmergencyContactRequestImplFromJson(Map<String, dynamic> json) =>
    _$CreateEmergencyContactRequestImpl(
      name: json['name'] as String,
      phone: json['phone'] as String,
      serviceType: $enumDecode(_$ServiceTypeEnumMap, json['serviceType']),
    );

Map<String, dynamic> _$$CreateEmergencyContactRequestImplToJson(
  _$CreateEmergencyContactRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'serviceType': _$ServiceTypeEnumMap[instance.serviceType]!,
};

const _$ServiceTypeEnumMap = {
  ServiceType.SAMU: 'SAMU',
  ServiceType.BOMBEIROS: 'BOMBEIROS',
  ServiceType.PM: 'PM',
  ServiceType.OUTRO: 'OUTRO',
};

_$UpdateEmergencyContactRequestImpl
_$$UpdateEmergencyContactRequestImplFromJson(Map<String, dynamic> json) =>
    _$UpdateEmergencyContactRequestImpl(
      name: json['name'] as String,
      phone: json['phone'] as String,
      serviceType: $enumDecode(_$ServiceTypeEnumMap, json['serviceType']),
    );

Map<String, dynamic> _$$UpdateEmergencyContactRequestImplToJson(
  _$UpdateEmergencyContactRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'serviceType': _$ServiceTypeEnumMap[instance.serviceType]!,
};

_$CreateUserRequestImpl _$$CreateUserRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateUserRequestImpl(
  name: json['name'] as String,
  email: json['email'] as String,
  role: $enumDecode(_$RoleEnumMap, json['role']),
  authProvider:
      $enumDecodeNullable(_$AuthProviderEnumMap, json['authProvider']) ??
      AuthProvider.LOCAL,
  provisionalPassword: json['provisionalPassword'] as bool? ?? true,
);

Map<String, dynamic> _$$CreateUserRequestImplToJson(
  _$CreateUserRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'role': _$RoleEnumMap[instance.role]!,
  'authProvider': _$AuthProviderEnumMap[instance.authProvider]!,
  'provisionalPassword': instance.provisionalPassword,
};

const _$RoleEnumMap = {Role.ADMIN: 'ADMIN', Role.SECURITY: 'SECURITY'};

const _$AuthProviderEnumMap = {
  AuthProvider.LOCAL: 'LOCAL',
  AuthProvider.GOOGLE: 'GOOGLE',
};

_$UpdateUserRequestImpl _$$UpdateUserRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateUserRequestImpl(
  name: json['name'] as String,
  email: json['email'] as String,
  role: $enumDecode(_$RoleEnumMap, json['role']),
  enable: json['enable'] as bool? ?? false,
  locked: json['locked'] as bool? ?? false,
  status: $enumDecode(_$EnumStatusEnumMap, json['status']),
);

Map<String, dynamic> _$$UpdateUserRequestImplToJson(
  _$UpdateUserRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'role': _$RoleEnumMap[instance.role]!,
  'enable': instance.enable,
  'locked': instance.locked,
  'status': _$EnumStatusEnumMap[instance.status]!,
};

const _$EnumStatusEnumMap = {
  EnumStatus.ATIVO: 'ATIVO',
  EnumStatus.INATIVO: 'INATIVO',
  EnumStatus.BLOQUEADO: 'BLOQUEADO',
};

_$UserFilterImpl _$$UserFilterImplFromJson(Map<String, dynamic> json) =>
    _$UserFilterImpl(
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']),
      query: json['query'] as String?,
      status: $enumDecodeNullable(_$EnumStatusEnumMap, json['status']),
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$$UserFilterImplToJson(_$UserFilterImpl instance) =>
    <String, dynamic>{
      'role': _$RoleEnumMap[instance.role],
      'query': instance.query,
      'status': _$EnumStatusEnumMap[instance.status],
      'page': instance.page,
      'size': instance.size,
    };

_$AccessLogReportRequestImpl _$$AccessLogReportRequestImplFromJson(
  Map<String, dynamic> json,
) => _$AccessLogReportRequestImpl(
  startDate: const DateOnlyConverter().fromJson(json['startDate'] as String),
  endDate: const DateOnlyConverter().fromJson(json['endDate'] as String),
  format: json['format'] as String? ?? 'pdf',
);

Map<String, dynamic> _$$AccessLogReportRequestImplToJson(
  _$AccessLogReportRequestImpl instance,
) => <String, dynamic>{
  'startDate': const DateOnlyConverter().toJson(instance.startDate),
  'endDate': const DateOnlyConverter().toJson(instance.endDate),
  'format': instance.format,
};

_$CreateSuspectRequestImpl _$$CreateSuspectRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CreateSuspectRequestImpl(
  name: json['name'] as String,
  birthDate: const DateOnlyConverter().fromJson(json['birthDate'] as String),
  cpf: json['cpf'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$$CreateSuspectRequestImplToJson(
  _$CreateSuspectRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'birthDate': const DateOnlyConverter().toJson(instance.birthDate),
  'cpf': instance.cpf,
  'description': instance.description,
};

_$UpdateSuspectRequestImpl _$$UpdateSuspectRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateSuspectRequestImpl(
  name: json['name'] as String,
  birthDate: const DateOnlyConverter().fromJson(json['birthDate'] as String),
  cpf: json['cpf'] as String,
  description: json['description'] as String,
  suspectStatus: $enumDecode(_$SuspectStatusEnumMap, json['suspectStatus']),
);

Map<String, dynamic> _$$UpdateSuspectRequestImplToJson(
  _$UpdateSuspectRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'birthDate': const DateOnlyConverter().toJson(instance.birthDate),
  'cpf': instance.cpf,
  'description': instance.description,
  'suspectStatus': _$SuspectStatusEnumMap[instance.suspectStatus]!,
};

const _$SuspectStatusEnumMap = {
  SuspectStatus.FORAGIDO: 'FORAGIDO',
  SuspectStatus.CAPTURADO: 'CAPTURADO',
};

_$SuspectFilterImpl _$$SuspectFilterImplFromJson(Map<String, dynamic> json) =>
    _$SuspectFilterImpl(
      query: json['query'] as String?,
      status: $enumDecodeNullable(_$SuspectStatusEnumMap, json['status']),
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$$SuspectFilterImplToJson(_$SuspectFilterImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'status': _$SuspectStatusEnumMap[instance.status],
      'page': instance.page,
      'size': instance.size,
    };
