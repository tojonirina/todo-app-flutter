import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/todolist.dart';
import 'package:todo/controllers/todolist_done.dart';
import 'package:todo/themes/dark.dart';

class TodoListDonePage extends StatelessWidget {
  const TodoListDonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoListDoneController controller = Get.find();
    final TodoListController listController = Get.find();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: darkBgColor,
              foregroundColor: Colors.white,
              title: const Text("Done task"),
            ),
            body: Obx(() => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.doneTodo.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    leading: IconButton(
                        onPressed: () {
                          listController.addTodo(controller.doneTodo[index]);
                          controller.markAsUndone(controller.doneTodo[index]);
                        },
                        icon: const Icon(
                          Icons.check_circle_outline,
                          color: darkFgColor,
                        )),
                    title: Text(controller.doneTodo[index]),
                  );
                }))));
  }
}
