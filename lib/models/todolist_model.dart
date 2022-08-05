import 'package:flutter/material.dart';

class TodoListModel extends ChangeNotifier {
  final List<String> _lists = [];

  List<String> get todoLists => _lists;

  int get listTodoNumber => _lists.length;

  void addTodo(String todo) {
    _lists.add(todo);
    notifyListeners();
  }

  void removeTodo(String todo) {
    _lists.remove(todo);
    notifyListeners();
  }
}
