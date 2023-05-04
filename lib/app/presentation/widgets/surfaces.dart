import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/data/entities/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  const TodoCard({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        children: [
          Checkbox(
            value: todo.hasBeenCompleted,
            onChanged: (value) {},
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.title),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
