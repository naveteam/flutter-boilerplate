import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/data/repository/todos.dart';
import 'package:flutter_boilerplate/app/presentation/viewmodels/todos/todos_state.dart';

abstract class TodosViewModel with ChangeNotifier {
  TodosState get uiState;

  Future<void> getAll();
}

class TodosViewModelImpl with ChangeNotifier implements TodosViewModel {
  final TodosRepository _todosRepository;

  TodosViewModelImpl(this._todosRepository);

  TodosState _uiState = const TodosState();

  @override
  TodosState get uiState => _uiState;

  @override
  Future<void> getAll() async {
    _uiState = _uiState.copyWith(
      isGettingItems: true,
      hasFailedToGetItems: false,
    );
    notifyListeners();

    try {
      final items = await _todosRepository.getAll();

      _uiState = _uiState.copyWith(
        isGettingItems: false,
        items: items,
      );
    } catch (exception) {
      _uiState = _uiState.copyWith(
        isGettingItems: false,
        hasFailedToGetItems: true,
      );
    } finally {
      notifyListeners();
    }
  }
}
