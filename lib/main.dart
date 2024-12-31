import 'package:flutter/material.dart';
import 'package:tasktest/presentation/views/tode/screens/todo_screen.dart';

void main() {
  runApp(const TaskTest());
}

class TaskTest extends StatelessWidget {
  const TaskTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoScreenView(),
    );
  }
}
