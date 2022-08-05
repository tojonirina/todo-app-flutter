import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todolist_deleted_model.dart';
import 'package:todo/models/todolist_done_model.dart';
import 'package:todo/models/todolist_model.dart';
import 'package:todo/themes/light.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _todoTextController = TextEditingController();
  bool canAddTodo = false;

  @override
  void dispose() {
    _todoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListModel>(
      builder: (BuildContext context, todoListModel, Widget? child) {
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
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          canAddTodo = true;
                        });
                      } else {
                        setState(() {
                          canAddTodo = false;
                        });
                      }
                    },
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
                        onPressed: canAddTodo
                            ? () {
                                todoListModel.addTodo(
                                    _todoTextController.text.toString());
                                _todoTextController.clear();
                                setState(() {
                                  canAddTodo = false;
                                });
                              }
                            : null,
                        icon: Icon(
                          Icons.add,
                          color: canAddTodo ? greenFgColor : greyBgColor,
                          size: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: todoListModel.listTodoNumber,
                    itemBuilder: (BuildContext context, index) => Dismissible(
                          key: ValueKey<String>(todoListModel.todoLists[index]),
                          onDismissed: (DismissDirection direction) {
                            Provider.of<TodoListDeletedModel>(context,
                                    listen: false)
                                .deleteTodo(todoListModel.todoLists[index]);
                            todoListModel
                                .removeTodo(todoListModel.todoLists[index]);
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
                                  Provider.of<TodoListDoneModel>(context,
                                          listen: false)
                                      .makeTodoToDone(
                                          todoListModel.todoLists[index]);
                                  todoListModel.removeTodo(
                                      todoListModel.todoLists[index]);
                                },
                                icon: const Icon(Icons.circle_outlined)),
                            title: Text(todoListModel.todoLists[index]),
                          ),
                        )))
          ],
        );
      },
    );
  }
}
