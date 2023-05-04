import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo extends Equatable {
  final num id;
  final String title;
  @JsonKey(name: 'completed')
  final bool hasBeenCompleted;

  const Todo({
    required this.id,
    required this.title,
    required this.hasBeenCompleted,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  @override
  List<Object?> get props {
    return [
      id,
      title,
      hasBeenCompleted,
    ];
  }

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
