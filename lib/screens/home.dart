import 'package:flutter/material.dart';
import 'package:todo_flutter/config/style.dart';
import 'package:todo_flutter/models/todo-model.dart';
import 'package:todo_flutter/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = [
    Todo(id: 1, title: 'finish this todo app', completed: false),
    Todo(id: 2, title: 'remember flutter', completed: false),
    Todo(id: 3, title: 'do some stuff', completed: false),
  ];
  List<Todo> selectedTodos = [];
  bool addingTodo = false;

  addTodoPress() {
    setState(() {
      addingTodo = true;
    });
  }

  cancel() {
    setState(() {
      addingTodo = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addingTodo
          ? SizedBox()
          : FloatingActionButton(
              onPressed: addTodoPress,
              child: Icon(Icons.add),
              backgroundColor: primaryColor,
            ),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
                color: addingTodo ? secondaryColor : backgroundColor,
                child: addingTodo
                    ? GestureDetector(
                        onTap: cancel, child: Icon(Icons.cancel_outlined))
                    : Text('Your Tasks',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0))),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: Column(
                  children: todos.map((todo) => TodoCard(todo: todo)).toList()),
            )
          ],
        ),
      ),
      bottomSheet: addingTodo ? AddTodo() : SizedBox(),
    );
  }
}
