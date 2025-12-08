
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class DateOnlyConverter implements JsonConverter<DateTime, String> {
  const DateOnlyConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}