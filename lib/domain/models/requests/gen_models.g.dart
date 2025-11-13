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
