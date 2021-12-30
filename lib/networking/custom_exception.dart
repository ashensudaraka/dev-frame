import 'package:dev_frame/generated/l10n.dart';

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message]): super(message, DevFrameLocalization.current.status502Error);
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, DevFrameLocalization.current.status400Error);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, DevFrameLocalization.current.status403Error);
}

class InvalidCredentials extends CustomException {
  InvalidCredentials([String message]) : super(message, DevFrameLocalization.current.invalidUserCredentialsError);
}

class UndefinedException extends CustomException {
  UndefinedException([String message]) : super(message,  DevFrameLocalization.current.status500Error);
}
