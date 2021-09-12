import 'package:flutter/material.dart';
import 'task.dart';
import 'dart:async';

class TaskData extends ChangeNotifier{

  List<Task> tasks = [
    // Task(name: 'Buy milk'),
    // Task(name: 'Buy eggs'),
    // Task(name: 'Buy bread'),
  ];

  int get taskCount{
    return tasks.length;
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }
}