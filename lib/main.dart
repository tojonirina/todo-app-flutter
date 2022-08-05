import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/right_to_left_transition.dart';
import 'package:todo/models/todolist_deleted_model.dart';
import 'package:todo/models/todolist_done_model.dart';
import 'package:todo/models/todolist_model.dart';
import 'package:todo/pages/todolist.dart';
import 'package:todo/pages/todolist_deleted.dart';
import 'package:todo/pages/todolist_done.dart';
import 'package:todo/themes/dark.dart';
import 'package:todo/themes/light.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (create) => TodoListModel()),
      ChangeNotifierProvider(create: (create) => TodoListDoneModel()),
      ChangeNotifierProvider(create: (create) => TodoListDeletedModel()),
    ],
    child: const TodoList(),
  ));
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: lightBgColor,
          filled: true,
          contentPadding:
              EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
      home: const TodoListHomePage(title: 'Taska'),
    );
  }
}

class TodoListHomePage extends StatefulWidget {
  const TodoListHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TodoListHomePage> createState() => _TodoListHomePageState();
}

class _TodoListHomePageState extends State<TodoListHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: darkBgColor,
            title: Text(widget.title),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            RightToLeftTransition(const TodoListDonePage()));
                      },
                      icon: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ))),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            RightToLeftTransition(const TodoListDeletedPage()));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ))),
            ],
          ),
          body: const TodoListPage()),
    );
  }
}
