 import 'dart:convert';

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
