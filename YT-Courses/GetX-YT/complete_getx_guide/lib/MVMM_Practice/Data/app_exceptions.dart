class AppExceptions implements Exception {
  final String? _message;
  final String? _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return "$_message$_prefix";
  }
}

class InternetExceptions extends AppExceptions {
  InternetExceptions([String? message]) : super(message, "Internet Exception");
}

class TimeOutExceptions extends AppExceptions {
  TimeOutExceptions([String? message]) : super(message, "Time OUt Exception");
}

class ServerExceptions extends AppExceptions {
  ServerExceptions([String? message]) : super(message, "Server Exception");
}

class FetchingDataExceptions extends AppExceptions {
  FetchingDataExceptions([String? message])
      : super(message, ": Error While Fetching Data");
}

class InvalidURLException extends AppExceptions {
  InvalidURLException([String? message]) : super(message, "Invalid URL");
}
