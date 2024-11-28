import '../response/rest_client_response.dart';

abstract interface class IRestClient {
  Future<RestClientResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
  Future<RestClientResponse<T>> put<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  });
  IRestClient get auth;
  IRestClient get unauth;
  void setBaseUrl(String url);
  Future<RestClientResponse> download({
    required String path,
    required String savePath,
  });
}
