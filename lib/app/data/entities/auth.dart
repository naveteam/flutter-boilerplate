import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String token;
  final String? refreshToken;

  const Auth({
    this.refreshToken,
    required this.token,
  });

  @override
  List<Object?> get props => [token, refreshToken];
}
