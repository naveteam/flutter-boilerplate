import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/app/data/entities/todo.dart';

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

  TodosState copyWith({
    bool? isGettingItems,
    bool? hasFailedToGetItems,
    List<Todo>? items,
  }) {
    return TodosState(
      isGettingItems: isGettingItems ?? this.isGettingItems,
      hasFailedToGetItems: hasFailedToGetItems ?? this.hasFailedToGetItems,
      items: items ?? this.items,
    );
  }
}
