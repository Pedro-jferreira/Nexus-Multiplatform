part of 'gen_models.dart';

@freezed
class SuspectResponse with _$SuspectResponse {
  const factory SuspectResponse({
    required int  id,
    required String name,
    @DateOnlyConverter()
    required DateTime birthDate,
    required String cpf,
    required String description,
    required List<ImageResponse> images,
    required SuspectStatus suspectStatus,
  }) = _SuspectResponse;

  factory SuspectResponse.fromJson(Map<String, dynamic> json) =>
      _$SuspectResponseFromJson(json);
}