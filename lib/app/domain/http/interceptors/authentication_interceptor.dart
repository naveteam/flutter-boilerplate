import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/app/domain/constants/status_code.dart';
import 'package:flutter_boilerplate/app/domain/http/exceptions/unauthorized_exception.dart';
import 'package:flutter_boilerplate/app/domain/persistence/credentials_persistence.dart';

class AuthenticationInterceptor extends Interceptor {
  AuthenticationInterceptor(this._credentialsPersistence);

  final CredentialsPersistence _credentialsPersistence;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final Map<String, dynamic> headersWithAuthorizationKey = {
      ...options.headers,
      'Authorization': await _credentialsPersistence.getCredentials()
    };
    return handler.next(options.copyWith(headers: headersWithAuthorizationKey));
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == StatusCode.unAuthorized.code) {
      throw UnAuthorizedException();
    }
    return handler.next(err);
  }
}
