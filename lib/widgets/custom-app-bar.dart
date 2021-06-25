import 'package:flutter/material.dart';
import 'package:todo_flutter/config/style.dart';

class CustomAppBar extends StatelessWidget {
  final Color color;
  final Widget child;
  const CustomAppBar(
      {Key? key, this.color = backgroundColor, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        child: Row(
          children: [child],
        ));
  }
}
