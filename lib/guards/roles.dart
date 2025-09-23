enum Roles{
  ROLE_ADMIN,
  ROLE_SEGURANCA;
}
Roles roleFromString(String role) {
  return Roles.values.firstWhere(
        (e) => e.toString().split('.').last == role,
    orElse: () => Roles.ROLE_ADMIN,
  );
}