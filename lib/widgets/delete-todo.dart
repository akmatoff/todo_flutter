import 'package:flutter/material.dart';
import 'package:todo_flutter/config/style.dart';

class DeleteTodo extends StatelessWidget {
  final VoidCallback onTap;
  const DeleteTodo({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: secondaryColor,
        height: 60.0,
        width: double.infinity,
        child: GestureDetector(
            onTap: onTap,
            child: Icon(Icons.delete, color: primaryColor, size: 30.0)));
  }
}
