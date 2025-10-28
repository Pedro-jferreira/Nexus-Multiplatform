part of 'gen_models.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required int id,
    required String name,
    required String email,
    required Role role,
    required bool enabled,
    required bool locked,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
}

@freezed
class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    required String accessToken,
    required String refreshToken,
  }) = _AuthTokens;

  factory AuthTokens.fromJson(Map<String, dynamic> json) => _$AuthTokensFromJson(json);
}