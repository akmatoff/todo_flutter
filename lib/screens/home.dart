import 'package:flutter/material.dart';
import 'package:todo_flutter/config/style.dart';
import 'package:todo_flutter/models/todo-model.dart';
import 'package:todo_flutter/widgets/widgets.dart';
import 'package:todo_flutter/store.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  List<Todo> todos = [];
  List<Todo> selectedTodos = [];
  bool selecting = false;
  bool addingTodo = false;
  int todoID = 0;

  int newTodoID = 0;
  List<Todo> newTodos = [];

  getData() async {
    newTodoID = await getTodoID();
    newTodos = await getTodos();
    print(newTodos);
  }

  @override
  void initState() {
    getData();
    setState(() {
      todos = newTodos;
      todoID = newTodoID;
    });
    super.initState();
  }

  addTodoPress() {
    setState(() {
      addingTodo = true;
    });
  }

  cancel() {
    setState(() {
      addingTodo = false;
      selecting = false;
      selectedTodos = [];
    });
  }

  addTodo() {
    setState(() {
      if (controller.text != '') {
        Todo newTodo =
            Todo(id: ++todoID, title: controller.text, completed: false);
        todos.add(newTodo);
        controller.text = '';

        saveData();
      }
    });
  }

  todoPress(Todo todo) {
    if (!selecting) {
      setState(() {
        todo.completed = !todo.completed;
      });
    } else {
      setState(() {
        if (!selectedTodos.contains(todo))
          selectedTodos.add(todo);
        else
          selectedTodos.remove(todo);
      });
    }
  }

  todoLongPress(Todo todo) {
    setState(() {
      selecting = true;
    });
  }

  deleteTodos() {
    setState(() {
      todos.removeWhere((todo) => selectedTodos.contains(todo));
    });
    saveData();
  }

  saveData() {
    saveTodoID(todoID);
    saveTodos(todos);
  }

  Widget bottomSheet() {
    if (addingTodo)
      return AddTodo(onTap: addTodo, controller: controller);
    else if (selecting)
      return DeleteTodo(onTap: deleteTodos);
    else
      return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: SafeArea(
            child: CustomAppBar(
                color:
                    addingTodo || selecting ? secondaryColor : backgroundColor,
                child: addingTodo || selecting
                    ? GestureDetector(
                        onTap: cancel, child: Icon(Icons.cancel_outlined))
                    : Text('Your Tasks',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0))),
          ),
        ),
        floatingActionButton: addingTodo || selecting
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
                        .map((todo) => TodoCard(
                              todo: todo,
                              selectedTodos: selectedTodos,
                              onTap: () => todoPress(todo),
                              onLongPress: () => todoLongPress(todo),
                            ))
                        .toList())),
          ],
        ),
        bottomSheet: bottomSheet());
  }
}
