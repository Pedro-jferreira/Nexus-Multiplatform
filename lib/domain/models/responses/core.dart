
part of 'gen_models.dart';
@Freezed(genericArgumentFactories: true)
class PageResponse<T> with _$PageResponse<T> {
  const factory PageResponse({
    required List<T> content,
    required int totalPages,
    required int totalElements,
    required int size,
    required int number, // Número da página atual
    required bool last,
    required bool first,
    required bool empty,
  }) = _PageResponse;

  factory PageResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT,
      ) =>
      _$PageResponseFromJson(json, fromJsonT);
}
