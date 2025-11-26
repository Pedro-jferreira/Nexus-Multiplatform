import 'package:Nexus/domain/models/enums/api_enums.dart';
import 'package:lucid_validation/lucid_validation.dart';


class ContactRequestDTO {
  String nome;
  String phone;
  ServiceType? type;

  ContactRequestDTO({
    required this.nome,
    required this.phone,
    required this.type
  });

  factory ContactRequestDTO.empty() => ContactRequestDTO(nome: '', phone: '', type: null);

  setNome(nome) => this.nome = nome;
  setPhone(phone) => this.phone = phone;
  setType(type) => this.type = type;
}
class ContactValidador extends LucidValidator<ContactRequestDTO> {
  ContactValidador() {

    ruleFor((param) => param.nome, key: 'nome')
        .notEmpty(message: 'Informe um nome.');

    ruleFor((param) => param.phone, key: 'phone')
        .notEmpty(message: 'Informe um número');

    ruleFor((param) => param.type, key: 'type')
        .isNotNull(message: 'Informe um nome.');

  }
}