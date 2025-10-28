abstract class AppException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic details;

  const AppException(this.message, {this.statusCode, this.details});

  @override
  String toString() => message;
}


class NetworkException extends AppException {
  const NetworkException(super.message, {super.statusCode, super.details});
}

class GenericException extends AppException{
  const GenericException(super.message, {super.statusCode, super.details});

}
