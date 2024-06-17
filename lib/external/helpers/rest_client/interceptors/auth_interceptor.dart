import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final RequestOptions(:headers, :extra) = options;
    const authHeaderKey = 'Authorization';
    headers.remove(authHeaderKey);

    if (extra case {'DIO_AUTH_KEY': true}) {
      const storage = FlutterSecureStorage();
      final accessToken = await storage.read(key: 'ACCESS_TOKEN');

      headers.addAll(
        {authHeaderKey: 'Bearer $accessToken'},
      );
    }
    handler.next(options);
    // super.onRequest(options, handler);
  }
}
