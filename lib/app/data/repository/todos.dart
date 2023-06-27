import 'package:flutter_boilerplate/app/data/entities/todo.dart';
import 'package:flutter_boilerplate/app/data/source/remote/todos.dart';

abstract class TodosRepository {
  Future<List<Todo>> getAll();
}

class TodosRepositoryImpl implements TodosRepository {
  final TodosRemoteDataSource _todosRemoteDataSource;

  const TodosRepositoryImpl(this._todosRemoteDataSource);

  @override
  Future<List<Todo>> getAll() async {
    final payload = await _todosRemoteDataSource.getAll();

    return List.generate(
      payload.length,
      (index) => Todo.fromJson(payload[index]),
    );
  }
}
