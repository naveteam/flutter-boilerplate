import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/app/data/entities/todo.dart';

part 'todos_state.g.dart';

@CopyWith()
class TodosState extends Equatable {
  final bool isGettingItems;
  final bool hasFailedToGetItems;

  final List<Todo> items;

  const TodosState({
    this.isGettingItems = false,
    this.hasFailedToGetItems = false,
    this.items = const [],
  });

  @override
  List<Object?> get props {
    return [
      isGettingItems,
      hasFailedToGetItems,
      items,
    ];
  }
}
