import 'package:Nexus/guards/roles.dart';
import 'package:lucid_validation/lucid_validation.dart';

class UserModel {
  String nome;
  String email;
  Role? role;
  bool? status;

  UserModel({
    required this.nome,
    required this.email,
    required this.role,
    required this.status,
  });

  factory UserModel.empty() =>
      UserModel(nome: '', email: '', role: null, status: null);

  setNome(nome) => this.nome = nome;
  setEmail(email) => this.email = email;
  setRole(role) => this.role = role;
  setStatus(status) => this.status = status;
}

class UsersValidador extends LucidValidator<UserModel> {

  UsersValidador.create() {
    ruleFor(
          (param) => param.nome,
      key: 'nome',
    ).notEmpty(message: 'Informe um nome.');

    ruleFor((param) => param.email, key: 'email')
        .notEmpty(message: 'Informe um Email')
        .validEmail(message: 'Digite um email Valido');

    ruleFor((param) => param.role, key: 'role',)
        .isNotNull(message: 'Selecione um cargo');

  }

  /// 🔹 Construtor para edição — inclui validação de status
  UsersValidador.edit() {
    ruleFor(
          (param) => param.nome,
      key: 'nome',
    ).notEmpty(message: 'Informe um nome.');

    ruleFor((param) => param.email, key: 'email')
        .notEmpty(message: 'Informe um Email')
        .validEmail(message: 'Digite um email Valido');

    ruleFor((param) => param.role, key: 'role',)
        .isNotNull(message: 'Selecione um cargo');

    ruleFor((param) => param.status, key: 'status',)
        .isNotNull(message: 'Selecione um status');
  }
}

