import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:api_app/add_task/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "go shopping"),
    Task(name: "buy a gift"),
    Task(name: "repair the car"),
  ];

  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }





}


