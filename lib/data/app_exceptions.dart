class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'No Internet');
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message]) : super(message, 'Request time out');
}
class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, 'Internal Server error');
}


class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, 'Invalid URL');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, '');
}