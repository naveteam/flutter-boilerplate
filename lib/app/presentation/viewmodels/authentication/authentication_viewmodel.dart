import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/domain/http/exceptions/unauthorized_exception.dart';
import 'package:flutter_boilerplate/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/authentication/authentication_state.dart';

abstract class AuthenticationViewModel with ChangeNotifier {
  AuthenticationState get uiState;

  Future<void> verify();
  Future<void> authenticate({
    required String credential,
    required String password,
  });
  Future<void> unAuthenticate();
}

class AuthenticationViewModelImpl
    with ChangeNotifier
    implements AuthenticationViewModel {
  AuthenticationViewModelImpl(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;
  late AuthenticationState _uiState = const UnAuthenticatedState();

  @override
  AuthenticationState get uiState => _uiState;

  @override
  Future<void> verify() async {
    try {
      final transferObject = await _authenticationRepository.verify();
      _uiState = AuthenticatedState(user: transferObject.user);
    } on UnAuthorizedException {
      _uiState = const UnAuthenticatedState();
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<void> authenticate({
    required String credential,
    required String password,
  }) async {
    try {
      final transferObject = await _authenticationRepository.authenticate(
        credential: credential,
        password: password,
      );
      _uiState = AuthenticatedState(user: transferObject.user);
    } catch (e) {
      _uiState = const UnAuthenticatedState();
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<void> unAuthenticate() async {
    try {
      await _authenticationRepository.unAuthenticate();
    } finally {
      _uiState = const UnAuthenticatedState();
      notifyListeners();
    }
  }
}
