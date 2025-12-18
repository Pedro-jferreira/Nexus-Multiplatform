part of 'gen_models.dart';
@freezed
class IncidentResponse with _$IncidentResponse {

  const factory IncidentResponse({
    required int id,
    required SuspectResponse suspect,
    String? imageUrl,
    double? score,
    String? location,
    IncidentStatus? incidentStatus,
    UserResponse? assignedUser,
    String? notes,
    String? processedUrl,
    @DateOnlyConverter()
    required DateTime createdAt,
    @DateOnlyConverter()
    DateTime? updatedAt,
  }) = _IncidentResponse;

  factory IncidentResponse.fromJson(Map<String, dynamic> json) =>
      _$IncidentResponseFromJson(json);
}

@freezed
class UpdateIncidentRequest with _$UpdateIncidentRequest {
  const factory UpdateIncidentRequest({
    String? location,
    IncidentStatus? incidentStatus, // Enviamos como String para o backend
    int? assignedUserId,
    String? notes,
  }) = _UpdateIncidentRequest;

  factory UpdateIncidentRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateIncidentRequestFromJson(json);
}