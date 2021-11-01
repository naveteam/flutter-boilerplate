import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/app/domain/constants/shared_preferences.dart';
import 'package:flutter_boilerplate/app/domain/constants/status_code.dart';
import 'package:flutter_boilerplate/app/domain/http/exceptions/unauthorized_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationInterceptor extends Interceptor {
  AuthenticationInterceptor(this._lazySharedPreferences);

  final Future<SharedPreferences> _lazySharedPreferences;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final Map<String, dynamic> headersWithAuthorizationKey = {
      ...options.headers,
      'Authorization': (await _lazySharedPreferences).getString(
        SharedPreferencesConstants.token,
      )
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
