import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/app/domain/entities/user.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class UnAuthenticatedState extends AuthenticationState {
  const UnAuthenticatedState();

  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthenticationState {
  const AuthenticatedState({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}
