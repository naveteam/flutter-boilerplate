import 'package:dio/dio.dart';

abstract class AuthenticationService {
  Future<Map<String, dynamic>> verify();
  Future<Map<String, dynamic>> authenticate({
    required String credential,
    required String password,
  });
}

class AuthenticationServiceImpl implements AuthenticationService {
  const AuthenticationServiceImpl(this._client);

  final Dio _client;

  @override
  Future<Map<String, dynamic>> verify() async {
    return {};
  }

  @override
  Future<Map<String, dynamic>> authenticate({
    required String credential,
    required String password,
  }) async {
    return {
      'user': {'email': 'tech@nave.rs', 'username': 'Tech'},
      'token': 'Bearer JWT'
    };
  }
}
