import 'package:flutter/foundation.dart';
import 'package:interfaces/interfaces.dart';

class MockServices {
  static ApiResponse<T> simulateMock<T>(ApiRequest apiRequest) {
    debugPrint('================================Request mocked=======================================================');
    debugPrint('Path mocked => ${apiRequest.path}');
    debugPrint('Body mocked => ${apiRequest.simulateMock?.body}');
    debugPrint('================================Request mocked=======================================================');
    var resultData = apiRequest.simulateMock?.body ?? {};
    return ApiResponse<T>(
      statusCode: apiRequest.simulateMock?.statusCode ?? 500,
      body: resultData,
      failure: apiRequest.simulateMock?.failure,
      request: apiRequest,
    );
  }
}
