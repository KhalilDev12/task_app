import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/taskModel.dart';

class ApiService {
  late final baseUrl;

  ApiService() {
    baseUrl = Uri.parse("https://jsonplaceholder.typicode.com/todos/");
  }

  // Function to get All Tasks from API
  Future<List<TaskModel>> getTasks() async {
    try {
      final response = await http.get(baseUrl);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        log("Successfully Fetched All Tasks");

        return data.map((task) => TaskModel.fromJson(task)).toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Function to add Task
  Future<TaskModel> addTask(TaskModel task) async {
    try {
      final response = await http.post(baseUrl,
          headers: {'Content-type': 'application/json; charset=UTF-8'},
          body: json.encode(task.toJson()));
      if (response.statusCode == 201) {
        log("Task Added Successfully");
        return TaskModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create task');
      }
    } catch (e) {
      print(e);
      throw Exception(
          'Failed to connect to the server. Please check your internet connection.');
    }
  }

  // Function to delete Task
  Future<void> deleteTask(int taskId) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$taskId'));
      if (response.statusCode == 200) {
        log("Task Deleted Successfully");
      } else {
        throw Exception('Failed to delete task');
      }
    } catch (e) {
      throw Exception(
          'Failed to connect to the server. Please check your internet connection.');
    }
  }

  // Function to update task
  Future<TaskModel> updateTask(TaskModel task) async {
    try {
      Uri url = Uri.parse("$baseUrl/${task.id}");

      final response = await http.put(url,
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },
          body: json.encode(task.toJson()));
      if (response.statusCode == 200) {
        log("Task Updated Successfully");
        return TaskModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to update task');
      }
    } catch (e) {
      throw Exception(
          'Failed to connect to the server. Please check your internet connection.');
    }
  }
}
