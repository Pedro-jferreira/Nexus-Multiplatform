part of 'gen_models.dart';


@freezed
class CreateUserRequest with _$CreateUserRequest {
  const factory CreateUserRequest({
    required String name,
    required String email,
    required Role role,
    @Default(AuthProvider.LOCAL) AuthProvider  authProvider,
    @Default(true) bool  provisionalPassword,
  }) = _CreateUserRequest;

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);
}
@freezed
class UpdateUserRequest with _$UpdateUserRequest {
  const factory UpdateUserRequest({
    required String name,
    required String email,
    required Role role,
    required bool  enable,
    required bool locked,
  }) = _UpdateUserRequest;

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);
}

@freezed
class UserFilter with _$UserFilter {
  const factory UserFilter({
    Role? role,
    String? query,
    EnumStatus? status,
    @Default(0) int page,
    @Default(10) int size,
  }) = _UserFilter;

  factory UserFilter.fromJson(Map<String, dynamic> json) =>
      _$UserFilterFromJson(json);
}
extension UserFilterQuery on UserFilter {
  Map<String, dynamic> toQueryParams() {
    final map = <String, dynamic>{
      'role': role?.name,
      'query': query,
      'status': status?.name,
      'page': page,
      'size': size,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }
}
