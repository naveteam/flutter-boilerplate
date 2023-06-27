import 'package:flutter_boilerplate/app/di/repository_module.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/todos/todos_viewmodel.dart';

abstract class ViewModelModule {
  static TodosViewModel get todosViewModel {
    return TodosViewModelImpl(
      RepositoryModule.todosRepository,
    );
  }
}
