import 'package:flutter_boilerplate/app/data/source/local/auth.dart';
import 'package:flutter_boilerplate/app/di/dio_module.dart';
import 'package:flutter_boilerplate/app/data/source/remote/todos.dart';
import 'package:flutter_boilerplate/app/di/secure_storage_module.dart';

abstract class DataSourcesModule {
  static TodosRemoteDataSource get todosRemoteDataSource {
    return TodosRemoteDataSourceImpl(DioModule.jsonPlaceholderClient);
  }

  static AuthLocalDataSource get authLocalDataSource {
    return AuthLocalDataSourceImpl(SecureStorageModule.storage);
  }
}
