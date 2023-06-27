import 'package:flutter_boilerplate/app/data/repository/todos.dart';
import 'package:flutter_boilerplate/app/di/datasource_module.dart';

abstract class RepositoryModule {
  static TodosRepository get todosRepository {
    return TodosRepositoryImpl(
      DataSourcesModule.todosRemoteDataSource,
    );
  }
}
