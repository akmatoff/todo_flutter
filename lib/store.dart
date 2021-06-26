import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/todo-model.dart';

void saveTodos(List<Todo> todos) async {
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  sharedPrefs.setString('todos', jsonEncode(todos));
}

Future<List<Todo>> getTodos() async {
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  List<Todo> todos = jsonDecode(sharedPrefs.getString('todos').toString())
      .map((todo) => Todo.fromJson(todo));
  return todos;
}

void saveTodoID(int todoID) async {
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  sharedPrefs.setInt('todoID', todoID);
}

Future<int> getTodoID() async {
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  int todoID = sharedPrefs.getInt('todoID')!.toInt();
  return todoID;
}
