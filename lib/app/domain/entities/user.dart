import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.email,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String email;
  final String username;

  @override
  List<Object> get props => [email, username];

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
