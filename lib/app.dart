import 'package:flutter/material.dart';
import 'Module_12/class_2/task_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TaskManager());
  }
}
