
part of 'gen_models.dart';

@freezed
class CreateEmergencyContactRequest with _$CreateEmergencyContactRequest {
  const factory CreateEmergencyContactRequest({
    required String name,
    required String phone,
    required ServiceType serviceType
  }) = _CreateEmergencyContactRequest;

  factory CreateEmergencyContactRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateEmergencyContactRequestFromJson(json);
}




@freezed
class UpdateEmergencyContactRequest with _$UpdateEmergencyContactRequest {
  const factory UpdateEmergencyContactRequest({
    required String name,
    required String phone,
    required ServiceType serviceType
  }) = _UpdateEmergencyContactRequest;

  factory UpdateEmergencyContactRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmergencyContactRequestFromJson(json);
}
