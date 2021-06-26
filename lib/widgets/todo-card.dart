import 'package:flutter/material.dart';
import 'package:todo_flutter/config/style.dart';
import 'package:todo_flutter/models/todo-model.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final List<Todo> selectedTodos;
  TodoCard(
      {Key? key,
      required this.todo,
      required this.onTap,
      required this.onLongPress,
      required this.selectedTodos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          margin: const EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10.0),
              border: selectedTodos.contains(todo)
                  ? Border.all(width: 1.5, color: primaryColor)
                  : null),
          child: Row(
            children: [
              !todo.completed
                  ? Icon(Icons.crop_square, size: 25.0)
                  : Icon(Icons.check_box, size: 25.0),
              SizedBox(width: 10.0),
              Text(todo.title)
            ],
          )),
    );
  }
}
