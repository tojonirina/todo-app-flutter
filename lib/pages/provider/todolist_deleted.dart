import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todolist_deleted_model.dart';
import 'package:todo/models/todolist_model.dart';

class TodoListDeletedPage extends StatelessWidget {
  const TodoListDeletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text("Deleted task"),
      ),
      body: Consumer<TodoListDeletedModel>(
        builder: (context, todoListDeletedModel, child) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: todoListDeletedModel.deletedTodoNumber,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  leading: IconButton(
                      onPressed: () {
                        Provider.of<TodoListModel>(context, listen: false)
                            .addTodo(todoListDeletedModel.deletedTodo[index]);
                        todoListDeletedModel.restoreTodo(
                            todoListDeletedModel.deletedTodo[index]);
                      },
                      icon: const Icon(
                        Icons.restore,
                        color: Colors.green,
                      )),
                  title: Text(todoListDeletedModel.deletedTodo[index]),
                );
              });
        },
      ),
    ));
  }
}
