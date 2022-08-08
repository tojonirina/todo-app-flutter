import 'package:get/get.dart';

class TodoListDoneController extends GetxController {
  final RxList _lists = [].obs;

  RxList get doneTodo => _lists;

  void markAsDone(String todo) {
    _lists.add(todo);
  }

  void markAsUndone(String todo) {
    _lists.remove(todo);
  }
}
