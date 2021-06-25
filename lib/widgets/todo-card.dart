import 'package:flutter/material.dart';
import 'package:todo_flutter/config/style.dart';
import 'package:todo_flutter/models/todo-model.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: [
            Icon(Icons.crop_square, size: 25.0),
            SizedBox(width: 10.0),
            Text(todo.title)
          ],
        ));
  }
}
