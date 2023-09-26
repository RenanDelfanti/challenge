import 'package:dio/dio.dart';
import 'package:interfaces/interfaces.dart';

import '../_exports.dart';

class Parser {
  static ApiResponse<T> parseSuccess<T>(
    Response<dynamic> response,
    ApiRequest request,
    Map<String, dynamic>? headers,
  ) {
    var result = ApiResponse<T>(
      body: response.data,
      headers: headers,
      request: request,
      statusCode: response.statusCode,
    );
    if (result.hasError) {
      return ApiResponse<T>(
          headers: headers,
          statusCode: response.statusCode,
          body: response.data,
          failure: MoviesException.fromMap(result.body as Map<String, dynamic>, response.statusCode),
          request: request);
    } else {
      return result;
    }
  }

  static ApiResponse<T> parseFailure<T>(
    dynamic error,
    ApiRequest request,
    Map<String, dynamic>? headers,
  ) {
    return ApiResponse(
      body: error,
      headers: headers,
      request: request,
      statusCode: 500,
      failure: getFailure(exception: error),
    );
  }

  static ApiResponse<T> parseErrorDio<T>(
    DioException error,
    ApiRequest request,
    Map<String, dynamic>? headers,
  ) {
    return ApiResponse(
      body: error.response?.data,
      headers: headers,
      request: request,
      statusCode: error.response?.statusCode ?? 500,
      failure: getFailure(errorDio: error),
    );
  }

  static MoviesException getFailure({
    DioException? errorDio,
    Object? exception,
  }) {
    if (errorDio != null) {
      return MoviesException(
        "${errorDio.message} | ${errorDio.response?.statusMessage}",
        false,
        errorDio.response?.statusCode ?? 500,
        999,
      );
    } else if (exception != null) {
      return MoviesException(
        exception.toString(),
        false,
        500,
        999,
      );
    }
    return MoviesException(
      'Unknown error',
      false,
      500,
      999,
    );
  }
}
