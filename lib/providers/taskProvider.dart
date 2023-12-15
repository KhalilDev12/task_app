import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/taskModel.dart';
import '../services/apiService.dart';

class TaskProvider extends ChangeNotifier {
  final ApiService apiService;
  BuildContext context;

  TaskProvider(this.apiService, this.context);

  List<TaskModel> _tasks = []; // List of Tasks

  List<TaskModel> get tasks => _tasks;

  Future<void> getTasks() async {
    try {
      _tasks = await apiService.getTasks();
      notifyListeners();
    } catch (e) {
      log("Error fetching tasks", error: e);
    }
  }

  Future<void> addTask(TaskModel task) async {
    tasks.add(task);
    apiService.addTask(task);
    notifyListeners();
  }

  Future<void> deleteTask(TaskModel task) async {
    tasks.remove(task);
    apiService.deleteTask(task.id);
    notifyListeners();
  }

  Future<void> updateTask(TaskModel task) async {
    int index = tasks.indexWhere((element) => element.id == task.id);
    tasks[index] = task;
    apiService.updateTask(task);
    notifyListeners();
  }
}
