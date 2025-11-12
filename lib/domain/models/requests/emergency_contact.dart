
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


class CreateEmegergency{
  final CreateEmergencyContactRequest request;
  final FileRequest file;

  CreateEmegergency({required this.request, required this.file});
}

class FileRequest{
  final Uint8List? file;
  final String? fileName;

  FileRequest({required this.file, required this.fileName});
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
