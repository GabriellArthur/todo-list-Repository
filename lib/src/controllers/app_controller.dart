import 'package:app/src/models/lista_model.dart';
import 'package:app/src/repositories/lista_repository.dart';
import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDartTheme = true;
  changeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }

  List<ListaModel> todos = [];
  final ListaRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  AppController([ListaRepository repository])
      : _repository = repository ?? ListaRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
