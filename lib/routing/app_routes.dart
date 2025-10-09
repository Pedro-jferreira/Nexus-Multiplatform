import '../guards/roles.dart';

class AppRoutes {
  // Rotas da Seção de Apresentação
  static const String placeholder = '/';
  static const String login = '/auth/login';
  static const String forgoutPassword ='resend';



  // Permissões de acesso por rota
  static final Map<String, List<Roles>> permissions = {
    placeholder: Roles.values,
  };

  static final Set<String> publicRoutes = {
    placeholder,
  };
}

