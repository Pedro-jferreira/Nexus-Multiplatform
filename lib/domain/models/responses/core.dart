
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

@freezed
class ImageResponse with _$ImageResponse {
  const factory ImageResponse({
    required int id,
    required String url,
    required String contentType,
    required int sizeBytes,
  }) = _ImageResponse;

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
}
