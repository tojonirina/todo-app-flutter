import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todolist_done_model.dart';
import 'package:todo/models/todolist_model.dart';
import 'package:todo/themes/dark.dart';

class TodoListDonePage extends StatelessWidget {
  const TodoListDonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: darkBgColor,
        foregroundColor: Colors.white,
        title: const Text("Done task"),
      ),
      body: Consumer<TodoListDoneModel>(
        builder: (context, todoListDoneModel, child) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: todoListDoneModel.doneTodoNumber,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  leading: IconButton(
                      onPressed: () {
                        Provider.of<TodoListModel>(context, listen: false)
                            .addTodo(todoListDoneModel.doneTodo[index]);
                        todoListDoneModel.makeTodoToUndone(
                            todoListDoneModel.doneTodo[index]);
                      },
                      icon: const Icon(
                        Icons.check_circle_outline,
                        color: darkFgColor,
                      )),
                  title: Text(todoListDoneModel.doneTodo[index]),
                );
              });
        },
      ),
    ));
  }
}
