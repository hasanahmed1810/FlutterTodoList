import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'screens/tasks_screens.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
