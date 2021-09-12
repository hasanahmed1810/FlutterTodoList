import 'package:flutter/material.dart';
import 'task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier{
  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for(String key in keys){
      addTask(prefs.get(key));
    }
  }

  TaskData(){
    loadData();
  }

  List<Task> tasks = [];

  int get taskCount{
    return tasks.length;
  }

  void addTask(String newTaskTitle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(newTaskTitle, newTaskTitle);
    final task = Task(name: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(task.name);
    tasks.remove(task);
    notifyListeners();
  }
}