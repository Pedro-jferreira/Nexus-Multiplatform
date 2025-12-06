import 'package:Nexus/domain/models/enums/api_enums.dart';
import 'package:lucid_validation/lucid_validation.dart';

class SuspectModel {
  String name;
  DateTime? birthDate;
  String cpf;
  String description;
  SuspectStatus? suspectStatus;

  SuspectModel({
    required this.name,
    required this.birthDate,
    required this.cpf,
    required this.description,
    this.suspectStatus,
  });

  factory SuspectModel.empty() => SuspectModel(
    name: '',
    birthDate: null,
    cpf: '',
    description: '',
    suspectStatus: null,
  );

  void clean() {
    name = '';
    birthDate = null;
    cpf = '';
    description = '';
    suspectStatus = null;
  }

  void setName(String name) => this.name = name;
  void setBirthDate(DateTime? birthDate) => this.birthDate = birthDate;
  void setCpf(String cpf) => this.cpf = cpf;
  void setDescription(String description) => this.description = description;
  void setStatus(SuspectStatus? suspectStatus) =>
      this.suspectStatus = suspectStatus;
}

class SuspectValidator extends LucidValidator<SuspectModel> {


  SuspectValidator.create() {
    final DateTime now = DateTime.now();
    final DateTime legalAgeLimit = DateTime(now.year - 18, now.month, now.day);
    ruleFor(
      (param) => param.name,
      key: 'name',
    ).notEmpty(message: 'Informe o nome do suspeito.');

    ruleFor((param) => param.birthDate, key: 'birthDate')

        .lessThanOrEqualTo(
          legalAgeLimit,
          message: 'O suspeito deve ser maior de idade (18+).',
        );

    ruleFor(
      (param) => param.cpf,
      key: 'cpf',
    ).notEmpty(message: 'Informe o CPF.').validCPF(message: 'CPF Inválido.');

    ruleFor((param) => param.description, key: 'description')
        .notEmpty(message: 'Informe uma descrição (ex: tatuagens, altura).')
        .minLength(50, message: 'A descrição deve ter no mínimo 50 caracteres')
        .maxLength(2000, message: 'Texto muito longo');
  }

  SuspectValidator.edit() {
    final DateTime now = DateTime.now();
    final DateTime legalAgeLimit = DateTime(now.year - 18, now.month, now.day);
    ruleFor(
      (param) => param.name,
      key: 'name',
    ).notEmpty(message: 'Informe o nome do suspeito.');

    ruleFor((param) => param.birthDate, key: 'birthDate')
        .isNotNull(message: 'Informe a data de nascimento.')
        .lessThanOrEqualTo(
          legalAgeLimit,
          message: 'O suspeito deve ser maior de idade (18+).',
        );

    ruleFor(
      (param) => param.cpf,
      key: 'cpf',
    ).notEmpty(message: 'Informe o CPF.').validCPF(message: 'CPF Inválido.');

    ruleFor((param) => param.description, key: 'description')
        .notEmpty(message: 'Informe uma descrição (ex: tatuagens, altura).')
        .minLength(50, message: 'A descrição deve ter no mínimo 50 caracteres')
        .maxLength(2000, message: 'Texto muito longo');

    ruleFor(
      (param) => param.suspectStatus,
      key: 'suspectStatus',
    ).isNotNull(message: 'O status do suspeito é obrigatório na edição.');
  }
}
