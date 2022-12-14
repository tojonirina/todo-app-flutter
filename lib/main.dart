import 'package:flutter/material.dart';
import 'package:todo/pages/getx/todolist.dart';
import 'package:todo/pages/getx/todolist_deleted.dart';
import 'package:todo/pages/getx/todolist_done.dart';
import 'package:todo/themes/dark.dart';
import 'package:todo/themes/light.dart';
import 'package:get/get.dart';

void main() {
  runApp(const TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo list GetX',
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
      home: const TodoListHomePage(title: 'TaskX'),
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
                        Get.to(const TodoListDonePage(),
                            transition: Transition.cupertino);
                      },
                      icon: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      ))),
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: IconButton(
                      onPressed: () {
                        Get.to(const TodoListDeletedPage(),
                            transition: Transition.cupertino);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ))),
            ],
          ),
          body: TodoListPage()),
    );
  }
}
