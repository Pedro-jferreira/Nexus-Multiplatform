import 'app_exceptions.dart';

class ApiException extends AppException {
  const ApiException(String message, {int? statusCode, dynamic details})
      : super(message, statusCode: statusCode, details: details);
}