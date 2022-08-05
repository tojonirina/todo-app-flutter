import 'package:flutter/material.dart';

class TodoListDoneModel extends ChangeNotifier {
  final List<String> _lists = [];

  List<String> get doneTodo => _lists;

  int get doneTodoNumber => _lists.length;

  void makeTodoToDone(String todo) {
    _lists.add(todo);
    notifyListeners();
  }

  void makeTodoToUndone(String todo) {
    _lists.remove(todo);
    notifyListeners();
  }
}
