import 'package:lucid_validation/lucid_validation.dart';

class LoginParamDto {
  String email;
  String password;

  LoginParamDto({
    required this.email,
    required this.password,
  });

  factory LoginParamDto.empty() => LoginParamDto(email: '', password: '');

  setEmail(String value) => email = value;

  setPassword(String value) => password = value;
}

class LoginParamValidation extends LucidValidator<LoginParamDto> {
  LoginParamValidation() {

    ruleFor((loginParamDto) => loginParamDto.email, key: 'email')
        .notEmpty(message: 'Informe o email')
        .validEmail(message: 'Email inválido');

    ruleFor((loginParamDto) => loginParamDto.password, key: 'password')
        .notEmpty(message: 'Informe a senha');
  }
}
class EmailRequestDto {
  String email;

  EmailRequestDto({
    required this.email,
  });

  factory EmailRequestDto.empty() => EmailRequestDto(email: '');

  setEmail(String value) => email = value;

}

class EmailRequestValidation extends LucidValidator<EmailRequestDto> {
  EmailRequestValidation() {

    ruleFor((loginParamDto) => loginParamDto.email, key: 'email')
        .notEmpty(message: 'Informe o email')
        .validEmail(message: 'Email inválido');
  }
}
