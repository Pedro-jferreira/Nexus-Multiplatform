part of 'gen_models.dart';
@freezed
class IncidentResponse with _$IncidentResponse {

  const factory IncidentResponse({
    required int id,
    SuspectResponse? suspect,
    String? imageUrl,
    double? score,
    String? location,
    IncidentStatus? incidentStatus,
    UserResponse? assignedUser,
    String? notes,
    String? processedUrl,
    @DateOnlyConverter()
    DateTime? createdAt,
    @DateOnlyConverter()
    DateTime? updatedAt,
  }) = _IncidentResponse;

  factory IncidentResponse.fromJson(Map<String, dynamic> json) =>
      _$IncidentResponseFromJson(json);
}