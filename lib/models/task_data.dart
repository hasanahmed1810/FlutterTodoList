import 'package:flutter/material.dart';
import 'task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class TaskData extends ChangeNotifier {
  SharedPreferences prefs;
  final uuid = Uuid();

  void loadData() async {
    prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (var key in keys) {
      final task = Task(name: prefs.get(key), id: key);
      tasks.add(task);
    }
    notifyListeners();
  }

  TaskData() {
    loadData();
  }

  List<Task> tasks = [];

  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTaskTitle) async {
    prefs = await SharedPreferences.getInstance();
    final id = uuid.v4();
    prefs.setString(id, newTaskTitle);
    final task = Task(name: newTaskTitle, id: id);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove(task.id);
    tasks.remove(task);
    notifyListeners();
  }
}
