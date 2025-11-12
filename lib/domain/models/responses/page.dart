part of 'gen_models.dart';

@Freezed(genericArgumentFactories: true)
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    required List<T> content,
    required int totalPages,
    required int totalElements,
    required int size,
    required int number, // Número da página atual
    required bool last,
    required bool first,
    required bool empty,
  }) = _PaginatedResponse;

  factory PaginatedResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT,
      ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);
}