import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/app/data/source/local/auth.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _authLocalDataSource;

  const AuthInterceptor(this._authLocalDataSource);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final auth = await _authLocalDataSource.getAuth();
    final optionsWithAuthorization = options.copyWith(
      headers: {
        ...options.headers,
        'Authorization': "Bearer ${auth?.token}",
      },
    );

    return handler.next(optionsWithAuthorization);
  }
}
