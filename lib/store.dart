import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/todo-model.dart';

late SharedPreferences sharedPrefs;

Future<void> init() async {
  sharedPrefs = await SharedPreferences.getInstance();
}

int getTodoID() {
  return sharedPrefs.getInt('todoID') ?? 0;
}

void setTodoID(int todoID) {
  sharedPrefs.setInt('todoID', todoID);
}

List<Todo> getTodos() {
  List<String> todoList = sharedPrefs.getStringList('todos') ?? [];
  return todoList
      .map((todo) => Todo.fromJson(json.decode(todo)))
      .toList(); // Convert JSON list to dart list of Todo
}

void setTodos(List<Todo> todos) {
  List<String> todoList = todos
      .map((todo) => json.encode(todo.toJson()))
      .toList(); // Convert dart lsit to JSON list
  sharedPrefs.setStringList('todos', todoList);
  print(todoList);
}
