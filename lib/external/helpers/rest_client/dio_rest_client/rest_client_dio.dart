import 'package:dio/dio.dart';

import '../exceptions/rest_client_exception.dart';
import '../interceptors/auth_interceptor.dart';
import '../interceptors/unauthentication_interceptor.dart';
import '../interfaces/rest_client_interface.dart';
import '../response/rest_client_response.dart';

class RestClientDio implements IRestClient {
  final _dio = Dio();
  static RestClientDio? _instance;

  RestClientDio._() {
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(UnauthenticationInterceptor());
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  static RestClientDio get instance => _instance ??= RestClientDio._();

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw RestClientException(
          error: e.error,
          message:
              'Não conseguimos comunicar com nossa base de dados. Confira o seu HOST configurado no aplicativo ou contate o suporte',
          statusCode: 0,
        );
      } else if ((e.response?.statusCode ?? 0) == 404) {
        throw RestClientException(
          error: e.error,
          message:
              'Não conseguimos encontrar esta rota em nosso sistema. Por favor, contate o suporte',
          statusCode: 404,
        );
      } else if ((e.response?.statusCode ?? 0) == 403) {
        throw RestClientException(
          error: e.error,
          message:
              'Este usuário não tem permissões para acessar o sistema. Por favor, contate o suporte',
          statusCode: 403,
        );
      } else if ((e.response?.statusCode ?? 0) == 401) {
        throw RestClientException(
          error: e.error,
          message:
              'Tempo da sessão do usuário encerrado. Por favor, faça login novamente',
          statusCode: 401,
        );
      } else if (e.type == DioExceptionType.connectionTimeout) {
        throw RestClientException(
          error: e.error,
          message:
              'Não conseguimos comunicar com nossa base de dados. Confira o seu HOST configurado no aplicativo ou contate o suporte',
          statusCode: 0,
        );
      } else {
        throw RestClientException(
          error: e.error,
          message: e.message,
          statusCode: e.response?.statusCode,
        );
      }
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw RestClientException(
          error: e.error,
          message:
              'Não conseguimos comunicar com nossa base de dados. Confira o seu HOST configurado no aplicativo ou contate o suporte',
          statusCode: 0,
        );
      } else if ((e.response?.statusCode ?? 0) == 404) {
        throw RestClientException(
          error: e.error,
          message:
              'Não conseguimos encontrar esta rota em nosso sistema. Por favor, contate o suporte',
          statusCode: 0,
        );
      } else if ((e.response?.statusCode ?? 0) == 403) {
        throw RestClientException(
          error: e.error,
          message:
              'Este usuário não tem permissões para acessar o sistema. Por favor, contate o suporte',
          statusCode: 0,
        );
      } else if (e.type == DioExceptionType.connectionTimeout) {
        throw RestClientException(
          error: e.error,
          message:
              'Não conseguimos comunicar com nossa base de dados. Confira o seu HOST configurado no aplicativo ou contate o suporte',
          statusCode: 0,
        );
      } else {
        throw RestClientException(
          error: e.error,
          message: e.message,
          statusCode: e.response?.statusCode,
        );
      }
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw RestClientException(
          error: e.error,
          message:
              'Não conseguimos comunicar com nossa base de dados. Confira o seu HOST configurado no aplicativo ou contate o suporte',
          statusCode: 0,
        );
      } else {
        throw RestClientException(
          error: e.error,
          message: e.message,
          statusCode: e.response?.statusCode,
        );
      }
    }
  }

  @override
  IRestClient get auth {
    _dio.options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  @override
  IRestClient get unauth {
    _dio.options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }

  @override
  void setBaseUrl(String url) {
    _dio.options.baseUrl = url;
  }

  @override
  Future<RestClientResponse> download({
    required String path,
    required String savePath,
  }) async {
    try {
      final response = await _dio.download(path, savePath);

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw RestClientException(
          error: e.error,
          message:
              'Não conseguimos comunicar com nossa base de dados. Confira o seu HOST configurado no aplicativo ou contate o suporte',
          statusCode: 0,
        );
      } else {
        throw RestClientException(
          error: e.error,
          message: e.message,
          statusCode: e.response?.statusCode,
        );
      }
    }
  }
}
