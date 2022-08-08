import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todolist.dart';
import 'package:todo/controllers/todolist_deleted.dart';
import 'package:todo/controllers/todolist_done.dart';
import 'package:todo/themes/light.dart';

class TodoListPage extends StatelessWidget {
  final _todoTextController = TextEditingController();

  TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller
    final TodoListController todolistController = Get.put(TodoListController());
    final TodoListDoneController todolistDoneController =
        Get.put(TodoListDoneController());
    final TodoListDeletedController todolistDeletedController =
        Get.put(TodoListDeletedController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: TextField(
                controller: _todoTextController,
                decoration: const InputDecoration(hintText: "Add a todo"),
              )),
              const SizedBox(
                width: 3,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: lightBgColor),
                child: InkWell(
                  child: IconButton(
                    onPressed: () {
                      if (_todoTextController.text.isNotEmpty) {
                        todolistController
                            .addTodo(_todoTextController.text.toString());
                        _todoTextController.clear();
                      } else {
                        Get.snackbar("Warning", "Le champ est vide",
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                      color: greenFgColor,
                      size: 30,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: todolistController.todos.length,
                itemBuilder: (BuildContext context, index) => Dismissible(
                    key: ValueKey<String>(todolistController.todos[index]),
                    onDismissed: (DismissDirection direction) {
                      todolistDeletedController
                          .deleteTodo(todolistController.todos[index]);
                      todolistController
                          .removeTodo(todolistController.todos[index]);
                    },
                    background: Container(
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: IconButton(
                          onPressed: () {
                            todolistDoneController
                                .markAsDone(todolistController.todos[index]);
                            todolistController
                                .removeTodo(todolistController.todos[index]);
                          },
                          icon: const Icon(Icons.circle_outlined)),
                      title: Text(
                        todolistController.todos[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    )),
              )),
        )
      ],
    );
  }
}
