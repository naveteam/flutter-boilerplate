import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/di/viewmodel_module.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/todos/todos_viewmodel.dart';
import 'package:flutter_boilerplate/app/presentation/widgets/builders.dart';
import 'package:flutter_boilerplate/app/presentation/widgets/surfaces.dart';
import 'package:go_router/go_router.dart';

class TodosScreen extends StatelessWidget {
  static GoRoute get route {
    return GoRoute(
      path: "/",
      builder: (context, state) => const TodosScreen(),
    );
  }

  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodosViewModel>(
      create: (context) => ViewModelModule.todosViewModel..getAll(),
      builder: (context, todosViewModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Todos"),
          bottom: todosViewModel.uiState.isGettingItems
              ? PreferredSize(
                  preferredSize: Size(Size.infinite.width, 12),
                  child: const LinearProgressIndicator(),
                )
              : null,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => TodoCard(
            todo: todosViewModel.uiState.items[index],
            key: Key("${todosViewModel.uiState.items[index].id}"),
          ),
          itemCount: todosViewModel.uiState.items.length,
        ),
      ),
    );
  }
}
