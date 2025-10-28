import 'app_exceptions.dart';

class ParseException extends AppException {
  const ParseException(super.message, {super.details});
}