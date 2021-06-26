import 'package:flutter/material.dart';
import 'package:todo_flutter/config/style.dart';
import 'package:todo_flutter/models/todo-model.dart';
import 'package:todo_flutter/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  List<Todo> todos = [];
  List<Todo> selectedTodos = [];
  bool addingTodo = false;
  int todoID = 0;

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

  addTodo() {
    setState(() {
      if (controller.text != '') {
        Todo newTodo =
            Todo(id: ++todoID, title: controller.text, completed: false);
        todos.add(newTodo);
        controller.text = '';
      }
    });
  }

  todoPress(Todo todo) {
    setState(() {
      todo.completed = !todo.completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: SafeArea(
          child: CustomAppBar(
              color: addingTodo ? secondaryColor : backgroundColor,
              child: addingTodo
                  ? GestureDetector(
                      onTap: cancel, child: Icon(Icons.cancel_outlined))
                  : Text('Your Tasks',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0))),
        ),
      ),
      floatingActionButton: addingTodo
          ? SizedBox()
          : FloatingActionButton(
              onPressed: addTodoPress,
              child: Icon(Icons.add),
              backgroundColor: primaryColor,
            ),
      body: ListView(
        children: [
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: Column(
                  children: todos
                      .map((todo) =>
                          TodoCard(todo: todo, onTap: () => todoPress(todo)))
                      .toList())),
        ],
      ),
      bottomSheet: addingTodo
          ? AddTodo(onTap: addTodo, controller: controller)
          : SizedBox(),
    );
  }
}
