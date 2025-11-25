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

extension RoleExtension on Role {
  String get label {
    switch (this) {
      case Role.ADMIN:
        return 'Administrador';
      case Role.SECURITY:
        return 'Segurança';
    }
  }
}