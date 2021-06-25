import 'package:flutter/material.dart';
import 'package:todo_flutter/config/style.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: secondaryColor,
        height: 60.0,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                maxLines: 1,
                autofocus: true,
                style: TextStyle(color: textColor, fontSize: 15.0),
                decoration: InputDecoration(
                    hintText: 'Enter your task...',
                    contentPadding: const EdgeInsets.all(10.0),
                    isDense: true,
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.send, color: primaryColor, size: 30.0)),
            )
          ],
        ));
  }
}
