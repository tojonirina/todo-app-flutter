import 'package:flutter/material.dart';

class TodoListDeletedModel extends ChangeNotifier {
  final List<String> _lists = [];

  List<String> get deletedTodo => _lists;

  int get deletedTodoNumber => _lists.length;

  void deleteTodo(String todo) {
    _lists.add(todo);
    notifyListeners();
  }

  void restoreTodo(String todo) {
    _lists.remove(todo);
    notifyListeners();
  }
}
