enum Role {
  ADMIN,
  SECURITY,
}


Role roleFromString(String role) {
  return Role.values.firstWhere(
        (e) => e.toString().split('.').last == role,
    orElse: () => Role.ADMIN,
  );
}