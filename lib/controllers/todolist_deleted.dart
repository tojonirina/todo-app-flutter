import 'package:get/get.dart';

class TodoListDeletedController extends GetxController {
  final RxList _lists = [].obs;

  RxList get deletedTodo => _lists;

  void deleteTodo(String todo) {
    _lists.add(todo);
  }

  void restoreTodo(String todo) {
    _lists.remove(todo);
  }
}
