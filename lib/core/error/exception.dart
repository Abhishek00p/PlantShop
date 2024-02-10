class CustomException implements Exception {
  CustomException(this.message);
  String message;
  String get errorMessage => message;
}

class UserAuthFailException extends CustomException {
  UserAuthFailException(super.message);
}

class SomethingWentWrongException extends CustomException {
  SomethingWentWrongException(super.message);
}
