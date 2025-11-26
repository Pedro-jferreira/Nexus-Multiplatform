part of 'gen_models.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
    String? fcmToken,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
class UpdatePasswordRequest with _$UpdatePasswordRequest {
  const factory UpdatePasswordRequest({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) = _UpdatePasswordRequest;

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);

  factory UpdatePasswordRequest.fromDto(UpdatePasswordDto dto) {
    return UpdatePasswordRequest(
      currentPassword: dto.currentPassword,
      newPassword: dto.newPassword,
      confirmNewPassword: dto.confirmNewPassword,
    );
  }
}

@freezed
class UnlockAccountRequest with _$UnlockAccountRequest {
  const factory UnlockAccountRequest({
    required String email,
  }) = _UnlockAccountRequest;

  factory UnlockAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$UnlockAccountRequestFromJson(json);

  factory UnlockAccountRequest.fromDto(UnlockAccountDto dto) {
    return UnlockAccountRequest(
      email: dto.email,
    );
  }
}
