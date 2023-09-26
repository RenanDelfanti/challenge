class MoviesException implements Exception {
  final String? _message;
  final bool? _success;
  final int? _statusCode;
  final int? _errorCode;

  MoviesException([this._message, this._success, this._statusCode, this._errorCode]);

  factory MoviesException.from({String? message, bool? success, int? realStatusCode, int? errorCode}) {
    if (realStatusCode == 404) {
      return NotFoundException(message, success, realStatusCode, errorCode);
    }
    if (realStatusCode == 401) {
      return UnauthorisedException(message, success, realStatusCode, errorCode);
    }
    if (realStatusCode == 400) {
      return InvalidInputException(message, success, realStatusCode, errorCode);
    }
    if (realStatusCode == 500) {
      return FetchDataException(message, success, realStatusCode, errorCode);
    }
    return MoviesException(
      message,
      success,
      realStatusCode,
      errorCode,
    );
  }

  factory MoviesException.fromMap(Map<String, dynamic>? map, [int? realStatusCode]) {
    if (realStatusCode == 404) {
      return NotFoundException(map?['status_message'] ?? '', map?['success'] ?? true, realStatusCode ?? 500, map?['status_code'] ?? 10);
    }
    if (realStatusCode == 401) {
      return UnauthorisedException(map?['status_message'] ?? '', map?['success'] ?? true, realStatusCode ?? 500, map?['status_code'] ?? 10);
    }
    if (realStatusCode == 400) {
      return InvalidInputException(map?['status_message'] ?? '', map?['success'] ?? true, realStatusCode ?? 500, map?['status_code'] ?? 10);
    }
    if (realStatusCode == 500) {
      return FetchDataException(map?['status_message'] ?? '', map?['success'] ?? true, realStatusCode ?? 500, map?['status_code'] ?? 10);
    }
    return MoviesException(
      map?['status_message'] ?? '',
      map?['success'] ?? true,
      realStatusCode ?? 501,
      map?['status_code'] ?? 10,
    );
  }

  @override
  String toString() {
    return 'MoviesException: $_message, $_success, $_statusCode, $_errorCode';
  }
}

class FetchDataException extends MoviesException {
  FetchDataException([String? message, bool? success, int? statusCode, int? errorCode]) : super(message, success, statusCode, errorCode);
}

class NotFoundException extends MoviesException {
  NotFoundException([String? message, bool? success, int? statusCode, int? errorCode]) : super(message, success, statusCode, errorCode);
}

class UnauthorisedException extends MoviesException {
  UnauthorisedException([String? message, bool? success, int? statusCode, int? errorCode]) : super(message, success, statusCode, errorCode);
}

class InvalidInputException extends MoviesException {
  InvalidInputException([String? message, bool? success, int? statusCode, int? errorCode]) : super(message, success, statusCode, errorCode);
}
