part of 'gen_models.dart';

@freezed
class EmergencyContactResponse with _$EmergencyContactResponse {
  const factory EmergencyContactResponse({
    required int id,
    required String name,
    required String phone,
    required ServiceType serviceType,
    required List<ImageResponse> images,
  }) = _EmergencyContactResponse;

  factory EmergencyContactResponse.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactResponseFromJson(json);
}
