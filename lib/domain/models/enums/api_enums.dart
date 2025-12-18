import 'package:freezed_annotation/freezed_annotation.dart';

enum ServiceType {
  @JsonValue('SAMU')
  SAMU,
  @JsonValue('BOMBEIROS')
  BOMBEIROS,
  @JsonValue('PM')
  PM,
  @JsonValue('OUTRO')
  OUTRO,
}

enum AuthProvider {
  @JsonValue('LOCAL')
  LOCAL,
  @JsonValue('GOOGLE')
  GOOGLE,
}

enum EnumStatus {
  @JsonValue('ATIVO')
  ATIVO,
  @JsonValue('INATIVO')
  INATIVO,
  @JsonValue('BLOQUEADO')
  BLOQUEADO,
}

enum SuspectStatus {
  @JsonValue('FORAGIDO')
  FORAGIDO,
  @JsonValue('CAPTURADO')
  CAPTURADO,
}

enum IncidentStatus {
  @JsonValue('POSITIVO')
  POSITIVO,
  @JsonValue('FALSO_POSITIVO')
  FALSO_POSITIVO,
  @JsonValue('ABERTO')
  ABERTO,
  @JsonValue('EM_PROCESSAMENTO')
  EM_PROCESSAMENTO
}
