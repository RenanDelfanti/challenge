import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:interfaces/interfaces.dart';

import '../_exports.dart';

class XDApiClient implements IApiClient {
  final IConfigServer? configServer;

  XDApiClient({this.configServer});

  @override
  String get authName => 'Authorization';

  @override
  String get prefixAuth => 'Bearer';

  @override
  String get baseModule => '';

  @override
  String get baseUrl => '';

  @override
  int get connectionTimeout => 60;

  @override
  bool get enableMock => false;

  String get contentTypePrefix => 'content-type';

  String get contentTypeValue => 'application/json;charset=UTF-8';

  List<Interceptor> interceptors = [];

  @override
  String get token => '';

  @override
  Map<String, dynamic> header() => {};

  @override
  Future<ApiResponse<T>> delete<T>({
    required ApiRequest apiRequest,
    String? requestUrl,
    String? requestModule,
  }) async {
    if (enableMock && apiRequest.simulateMock != null) {
      return MockServices.simulateMock(apiRequest);
    }
    final clientHttp = _getClient();
    try {
      final url = _buildUrl(
        requestUrl: requestUrl,
        requestModule: requestModule,
        apiRequest: apiRequest,
      );

      final headers = _getHeader(request: apiRequest);

      var result = await clientHttp
          .delete(
            url,
            data: _getBody(apiRequest),
            queryParameters: _getQueryParameters(apiRequest),
            options: Options(
              headers: headers,
              contentType: apiRequest.contentType,
            ),
          )
          .timeout(Duration(seconds: connectionTimeout));
      return Parser.parseSuccess(result, apiRequest, headers);
    } on TimeoutException catch (e) {
      return Parser.parseFailure(e, apiRequest, {'message': '${e.message}'});
    } on DioException catch (dioError) {
      return Parser.parseErrorDio(dioError, apiRequest, {});
    } catch (ex) {
      return Parser.parseFailure(ex, apiRequest, {});
    } finally {
      clientHttp.close();
    }
  }

  @override
  Future<ApiResponse<T>> get<T>({
    required ApiRequest apiRequest,
    String? requestUrl,
    String? requestModule,
  }) async {
    if (enableMock && apiRequest.simulateMock != null) {
      return MockServices.simulateMock(apiRequest);
    }
    final clientHttp = _getClient();
    try {
      final url = _buildUrl(
        requestUrl: requestUrl,
        requestModule: requestModule,
        apiRequest: apiRequest,
      );

      final headers = _getHeader(request: apiRequest);

      var result = await clientHttp
          .get(
            url,
            queryParameters: _getQueryParameters(apiRequest),
            options: Options(
              headers: headers,
            ),
          )
          .timeout(Duration(seconds: connectionTimeout));
      return Parser.parseSuccess(result, apiRequest, headers);
    } on TimeoutException catch (e) {
      return Parser.parseFailure(e, apiRequest, {'message': '${e.message}'});
    } on DioException catch (dioError) {
      return Parser.parseErrorDio(dioError, apiRequest, {});
    } catch (ex) {
      return Parser.parseFailure(ex, apiRequest, {});
    } finally {
      clientHttp.close();
    }
  }

  @override
  Future<ApiResponse<T>> patch<T>({
    required ApiRequest apiRequest,
    String? requestUrl,
    String? requestModule,
  }) async {
    if (enableMock && apiRequest.simulateMock != null) {
      return MockServices.simulateMock(apiRequest);
    }
    final clientHttp = _getClient();
    try {
      final url = _buildUrl(
        requestUrl: requestUrl,
        requestModule: requestModule,
        apiRequest: apiRequest,
      );

      final headers = _getHeader(request: apiRequest);

      var result = await clientHttp
          .patch(
            url,
            data: _getBody(apiRequest),
            queryParameters: _getQueryParameters(apiRequest),
            options: Options(
              headers: headers,
              contentType: apiRequest.contentType,
            ),
          )
          .timeout(Duration(seconds: connectionTimeout));
      return Parser.parseSuccess(result, apiRequest, headers);
    } on TimeoutException catch (e) {
      return Parser.parseFailure(e, apiRequest, {'message': '${e.message}'});
    } on DioException catch (dioError) {
      return Parser.parseErrorDio(dioError, apiRequest, {});
    } catch (ex) {
      return Parser.parseFailure(ex, apiRequest, {});
    } finally {
      clientHttp.close();
    }
  }

  @override
  Future<ApiResponse<T>> post<T>({
    required ApiRequest apiRequest,
    String? requestUrl,
    String? requestModule,
  }) async {
    if (enableMock && apiRequest.simulateMock != null) {
      return MockServices.simulateMock(apiRequest);
    }
    final clientHttp = _getClient();
    try {
      final url = _buildUrl(
        requestUrl: requestUrl,
        requestModule: requestModule,
        apiRequest: apiRequest,
      );

      final headers = _getHeader(request: apiRequest);

      var result = await clientHttp
          .post(
            url,
            data: _getBody(apiRequest),
            queryParameters: _getQueryParameters(apiRequest),
            options: Options(
              headers: headers,
              contentType: apiRequest.contentType,
            ),
          )
          .timeout(Duration(seconds: connectionTimeout));
      return Parser.parseSuccess(result, apiRequest, headers);
    } on TimeoutException catch (e) {
      return Parser.parseFailure(e, apiRequest, {'message': '${e.message}'});
    } on DioException catch (dioError) {
      return Parser.parseErrorDio(dioError, apiRequest, {});
    } catch (ex) {
      return Parser.parseFailure(ex, apiRequest, {});
    } finally {
      clientHttp.close();
    }
  }

  @override
  Future<ApiResponse<T>> put<T>({
    required ApiRequest apiRequest,
    String? requestUrl,
    String? requestModule,
  }) async {
    if (enableMock && apiRequest.simulateMock != null) {
      return MockServices.simulateMock(apiRequest);
    }
    final clientHttp = _getClient();
    try {
      final url = _buildUrl(
        requestUrl: requestUrl,
        requestModule: requestModule,
        apiRequest: apiRequest,
      );

      final headers = _getHeader(request: apiRequest);

      var result = await clientHttp
          .put(
            url,
            data: _getBody(apiRequest),
            queryParameters: _getQueryParameters(apiRequest),
            options: Options(
              headers: headers,
              contentType: apiRequest.contentType,
            ),
          )
          .timeout(Duration(seconds: connectionTimeout));
      return Parser.parseSuccess(result, apiRequest, headers);
    } on TimeoutException catch (e) {
      return Parser.parseFailure(e, apiRequest, {'message': '${e.message}'});
    } on DioException catch (dioError) {
      return Parser.parseErrorDio(dioError, apiRequest, {});
    } catch (ex) {
      return Parser.parseFailure(ex, apiRequest, {});
    } finally {
      clientHttp.close();
    }
  }

  Dio _getClient() {
    final Dio dio = Dio();
    dio.interceptors.addAll(interceptors);
    return dio;
  }

  String _buildUrl({
    String? requestUrl,
    String? requestModule,
    required ApiRequest apiRequest,
  }) {
    final String url = (apiRequest.url ?? requestUrl ?? configServer?.getConfigByEnv(key: ConfigServerConstants.baseUrl) ?? baseUrl);
    final String module = (requestModule ?? baseModule);
    return '$url$module${apiRequest.path}';
  }

  dynamic _getBody(ApiRequest apiRequest) {
    if (!apiRequest.needsParse) {
      return apiRequest.body;
    }
    if (apiRequest.body is FormData) {
      return apiRequest.body;
    }
    if (apiRequest.body is String) {
      return apiRequest.body;
    } else {
      return jsonEncode(apiRequest.body);
    }
  }

  Map<String, dynamic>? _getQueryParameters(ApiRequest apiRequest) {
    if (apiRequest.queryParameters == {}) {
      return null;
    }
    return apiRequest.queryParameters;
  }

  Map<String, dynamic> _getHeader({required ApiRequest request}) {
    if (request.overrideHeaders) {
      return request.headers!;
    }

    var tokenRequest = (request.token ?? token);
    final headerRequest = tokenRequest.isEmpty
        ? <String, dynamic>{contentTypePrefix: contentTypeValue}
        : <String, dynamic>{
            contentTypePrefix: contentTypeValue,
            authName: '$prefixAuth $tokenRequest',
          };

    if (request.headers != null) {
      headerRequest.addAll(request.headers!);
    }

    if (header() != {}) {
      headerRequest.addAll(header());
    }

    return headerRequest;
  }
}
