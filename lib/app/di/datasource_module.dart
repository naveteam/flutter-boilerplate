import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/app/data/source/remote/todos.dart';

abstract class DataSourcesModule {
  static BaseOptions get jsonPlaceholderClientOptions {
    return BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      contentType: "application/json",
      responseType: ResponseType.json,
    );
  }

  static Dio get jsonPlaceholderClient {
    return Dio(jsonPlaceholderClientOptions);
  }

  static TodosRemoteDataSource get todosRemoteDataSource {
    return TodosRemoteDataSourceImpl(jsonPlaceholderClient);
  }
}
