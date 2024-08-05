import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UnauthenticationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('Base URL: ${options.baseUrl}');
    debugPrint('URI: ${options.path}');
    debugPrint('Data: ${options.data}');
    debugPrint('Content Type: ${options.contentType}');
    debugPrint('Headers: ${options.headers}');
    debugPrint('Query Parameters: ${options.queryParameters}');
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('Error Message: ${err.message}');
    debugPrint('Error Status Code: ${err.response?.statusCode}');
    debugPrint('Error: ${err.error}');
    debugPrint('Error RuntimeType: ${err.error.runtimeType}');
    debugPrint('Error Type: ${err.type}');
    if (err.response?.statusCode == 403) {
      final exception = err.copyWith(
        message: 'Este usuário não tem permissões para acessar o sistema',
      );
      handler.reject(exception);
    }
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response Status Code: ${response.statusCode}');
    debugPrint('Response Headers: ${response.headers}');
    debugPrint('Response Data: ${response.data}');
    handler.next(response);
  }
}
