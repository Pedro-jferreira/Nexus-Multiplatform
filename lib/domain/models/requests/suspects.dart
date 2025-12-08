part of 'gen_models.dart';

@freezed
class CreateSuspectRequest with _$CreateSuspectRequest {
  const factory CreateSuspectRequest({
    required String name,
    @DateOnlyConverter()
    required DateTime  birthDate,
    required String cpf,
    required String description,
  }) = _CreateSuspectRequest;

  factory CreateSuspectRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSuspectRequestFromJson(json);
}

@freezed
class UpdateSuspectRequest with _$UpdateSuspectRequest {
  const factory UpdateSuspectRequest({
    required String name,
    @DateOnlyConverter()
    required DateTime  birthDate,
    required String cpf,
    required String description,
    required SuspectStatus suspectStatus,
  }) = _UpdateSuspectRequest;

  factory UpdateSuspectRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSuspectRequestFromJson(json);
}

@freezed
class SuspectFilter with _$SuspectFilter {
  const factory SuspectFilter({
    String? query,
    SuspectStatus? status,
    @Default(0) int page,
    @Default(10) int size,
  }) = _SuspectFilter;

  factory SuspectFilter.fromJson(Map<String, dynamic> json) =>
      _$SuspectFilterFromJson(json);
}
extension SuspectFilterQuery on SuspectFilter {
  Map<String, dynamic> toQueryParams() {
    final map = <String, dynamic>{
      'query': query,
      'status': status?.name,
      'page': page,
      'size': size,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }
}
