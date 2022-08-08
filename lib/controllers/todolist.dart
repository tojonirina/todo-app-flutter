import 'package:get/get.dart';

class TodoListController extends GetxController {
  final RxList _lists = [].obs;

  RxList get todos => _lists;

  void addTodo(String todo) {
    _lists.add(todo);
  }

  void removeTodo(String todo) {
    _lists.remove(todo);
  }
}
