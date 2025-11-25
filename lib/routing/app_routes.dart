import '../guards/roles.dart';

class AppRoutes {
  // Rotas da Seção de Apresentação
  static const String placeholder = '/';
  static const String login = '/auth/login';
  static const String forgoutPassword ='resend';

  static const String dashBoard ='/dashBoard';
  static const String fugitives ='/fugitives';
  static const String users ='/users';
  static const String chat ='/chat';
  static const String incidents ='/incidents';
  static const String emergencyContacts ='/contacts';
  static const String profile ='/profile';





  // Permissões de acesso por rota
  static final Map<String, List<Role>> permissions = {
    placeholder: Role.values,
  };

  static final Set<String> publicRoutes = {
  };
}

