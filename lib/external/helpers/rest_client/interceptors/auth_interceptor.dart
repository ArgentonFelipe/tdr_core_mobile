import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      final storage = SharedPreferencesAsync();
      final accessToken = await storage.getString('ACCESS_TOKEN');

      headers.addAll(
        {authHeaderKey: 'Bearer $accessToken'},
      );
    }
    handler.next(options);
    // super.onRequest(options, handler);
  }
}
