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
        .maxLength(250, message: 'Texto muito longo');
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
        .maxLength(250, message: 'Texto muito longo');

    ruleFor(
      (param) => param.suspectStatus,
      key: 'suspectStatus',
    ).isNotNull(message: 'O status do suspeito é obrigatório na edição.');
  }
}


class AccessLogReportModel {
  DateTime? startDate;
  DateTime? endDate;
  String format;

  AccessLogReportModel({
    required this.startDate,
    required this.endDate,
    this.format = 'pdf',
  });

  factory AccessLogReportModel.empty() => AccessLogReportModel(
    startDate: null,
    endDate: null,
    format: 'pdf',
  );

  void clean() {
    startDate = null;
    endDate = null;
    format = 'pdf';
  }

  void setStartDate(DateTime? date) => startDate = date;
  void setEndDate(DateTime? date) => endDate = date;
  void setFormat(String format) => this.format = format;

}
class AccessLogReportValidator extends LucidValidator<AccessLogReportModel> {

  AccessLogReportValidator() {

    // --- Data Inicial ---
    ruleFor((model) => model.startDate, key: 'startDate')
        .isNotNull(message: 'Informe a data inicial.')
        .equalTo((model) {
      final start = model.startDate;
      final end = model.endDate;

      // Se não tivermos as duas datas, retornamos o próprio start para passar (já validado no isNotNull)
      if (start == null || end == null) return start;

      // LÓGICA: Se start <= end, está valido.
      // Retornamos 'start' para que o equalTo compare (start == start) e dê TRUE.
      if (start.compareTo(end) <= 0) {
        return start;
      }

      // Se for inválido (start > end), retornamos 'end'.
      // O equalTo vai comparar (start == end) -> FALSE -> Dispara erro.
      return end;
    },
        message: 'A data inicial não pode ser posterior à data final.');

    // --- Data Final ---
    ruleFor((model) => model.endDate, key: 'endDate')
        .isNotNull(message: 'Informe a data final.')
        .equalTo((model) {
      final start = model.startDate;
      final end = model.endDate;

      if (start == null || end == null) return end;

      // LÓGICA: Se end >= start, está valido.
      // Retornamos 'end' para que o equalTo compare (end == end) e dê TRUE.
      if (end.compareTo(start) >= 0) {
        return end;
      }

      // Se inválido, força o erro retornando start
      return start;
    },
        message: 'A data final não pode ser anterior à data inicial.');
  }
}