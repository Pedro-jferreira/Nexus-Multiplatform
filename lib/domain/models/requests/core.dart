part of 'gen_models.dart';

@freezed
class FileRequest with _$FileRequest {
  const factory FileRequest({
    required Uint8List? file,
    required String? fileName,
  }) = _FileRequest;
}

@freezed
class FilePayload<T> with _$FilePayload<T> {
  const factory FilePayload({
    required T request,
    required FileRequest file,
  }) = _FilePayload<T>;
}
@freezed
class FilePayloadUpdate<T> with _$FilePayloadUpdate<T> {
  const factory FilePayloadUpdate({
    required int id,
    required T request,
    required FileRequest file,
  }) = _FilePayloadUpdate<T>;
}

class Optional<T> {
  final T? value;
  final bool isPresent;

  const Optional.absent()
      : value = null,
        isPresent = false;

  const Optional.of(this.value) : isPresent = true;
}