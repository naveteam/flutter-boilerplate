import 'package:flutter_boilerplate/app/domain/dto/authentication_dto.dart';
import 'package:flutter_boilerplate/app/domain/http/services/authentication_service.dart';
import 'package:flutter_boilerplate/app/domain/persistence/credentials_persistence.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationTransferObject> verify();
  Future<AuthenticationTransferObject> authenticate({
    required String credential,
    required String password,
  });
  Future<void> unAuthenticate();
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl(
    this._authenticationService,
    this._credentialsPersistence,
  );

  final AuthenticationService _authenticationService;
  final CredentialsPersistence _credentialsPersistence;

  @override
  Future<AuthenticationTransferObject> verify() async {
    final response = await _authenticationService.verify();
    return AuthenticationTransferObject.fromJson(response);
  }

  @override
  Future<AuthenticationTransferObject> authenticate({
    required String credential,
    required String password,
  }) async {
    final response = await _authenticationService.authenticate(
      credential: credential,
      password: password,
    );
    await _credentialsPersistence.storeCredentials(token: response['token']);
    return AuthenticationTransferObject.fromJson(response);
  }

  @override
  Future<void> unAuthenticate() async {
    await _credentialsPersistence.clearCredentials();
  }
}
