import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todolist.dart';
import 'package:todo/controllers/todolist_deleted.dart';

class TodoListDeletedPage extends StatelessWidget {
  const TodoListDeletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoListDeletedController controller = Get.find();
    final TodoListController todolistController = Get.find();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              title: const Text("Deleted task"),
            ),
            body: Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.deletedTodo.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    leading: IconButton(
                        onPressed: () {
                          todolistController
                              .addTodo(controller.deletedTodo[index]);
                          controller.restoreTodo(controller.deletedTodo[index]);
                        },
                        icon: const Icon(
                          Icons.restore,
                          color: Colors.green,
                        )),
                    title: Text(controller.deletedTodo[index]),
                  );
                }))));
  }
}
