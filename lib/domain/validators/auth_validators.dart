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

class UpdatePasswordDto {
  String currentPassword;
  String newPassword;
  String confirmNewPassword;

  UpdatePasswordDto({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  factory UpdatePasswordDto.empty() => UpdatePasswordDto(
    currentPassword: '',
    newPassword: '',
    confirmNewPassword: '',
  );

  void setCurrentPassword(String value) => currentPassword = value;

  void setNewPassword(String value) => newPassword = value;

  void setConfirmNewPassword(String value) => confirmNewPassword = value;

  void clean() {
    setCurrentPassword('');
    setNewPassword('');
    setConfirmNewPassword('');
  }
}

class UpdatePasswordValidator extends LucidValidator<UpdatePasswordDto> {
  UpdatePasswordValidator() {

    ruleFor((dto) => dto.currentPassword, key: 'current_password')
        .notEmpty(message: 'Informe sua senha atual para continuar');

    ruleFor((dto) => dto.newPassword, key: 'new_password')
        .notEmpty(message: 'Informe a nova senha')
        .minLength(8, message: 'A nova senha deve ter no mínimo 8 caracteres')
        .mustHaveSpecialCharacter(message: 'A senha precisa de pelo menos um caractere especial (!@#\$)');

    ruleFor((dto) => dto.confirmNewPassword, key: 'confirm_password')
        .notEmpty(message: 'Confirme a nova senha')
        .equalTo(
            (dto) => dto.newPassword,
        message: 'As senhas não coincidem'
    );
  }
}