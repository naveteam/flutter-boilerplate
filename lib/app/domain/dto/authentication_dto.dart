import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/app/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authentication_dto.g.dart';

@JsonSerializable()
class AuthenticationTransferObject extends Equatable {
  const AuthenticationTransferObject({
    required this.user,
    required this.token,
  });

  factory AuthenticationTransferObject.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationTransferObjectFromJson(json);

  final User user;
  final String token;

  @override
  List<Object> get props => [user, token];

  Map<String, dynamic> toJson() => _$AuthenticationTransferObjectToJson(this);
}
