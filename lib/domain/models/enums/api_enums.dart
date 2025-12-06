import 'package:freezed_annotation/freezed_annotation.dart';

enum ServiceType {
  @JsonValue('SAMU')
  SAMU,
  @JsonValue('BOMBEIROS')
  BOMBEIROS,
  @JsonValue('PM')
  PM,
  @JsonValue('OUTRO')
  OUTRO
}
 enum AuthProvider {
   @JsonValue('LOCAL')
   LOCAL,
   @JsonValue('GOOGLE')
   GOOGLE
 }

enum EnumStatus {
  @JsonValue('ATIVO')
  ATIVO,
  @JsonValue('INATIVO')
  INATIVO,
  @JsonValue('BLOQUEADO')
  BLOQUEADO
}

enum SuspectStatus {
  @JsonValue('FORAGIDO')
  FORAGIDO,
  @JsonValue('CAPTURADO')
  CAPTURADO
}


