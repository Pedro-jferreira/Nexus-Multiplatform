part of 'gen_models.dart';

enum ServiceType{
  SAMU,
  BOMBEIROS,
  PM,
  OUTRO
}

@freezed
class EmergencyContactsResponse with _$EmergencyContactsResponse{
  const factory EmergencyContactsResponse({
    required int id,
    required String name,
    required String phone,
    required ServiceType serviceType,
    required List<ImageResponse> images
}) = _EmeregencyContactResponse;

  factory EmergencyContactsResponse.fromJson(Map<String, dynamic> json) => _$EmergencyContactsResponseFromJson(json);

}

@freezed
class ImageResponse with _$ImageResponse{
  const factory ImageResponse({
    required int id,
    required String url,
    required String contentType,
    required int sizeBytes,
}) = _ImageResponse;

  factory ImageResponse.fromJson(Map<String, double> json) => _$ImageResponseFromJson(json);
}