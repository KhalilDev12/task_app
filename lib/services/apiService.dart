import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_app/models/taskModel.dart';

class ApiService {
  late final String apiUrl;

  ApiService() {
    apiUrl = "https://jsonplaceholder.typicode.com/todos/";
  }

  Future<List<TaskModel>> getTasks() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((task) => TaskModel.fromJson(task)).toList();
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TaskModel> addTask(TaskModel task) async {
    try {
      Uri url = Uri.parse(apiUrl);
      final response = await http.post(url,
          headers: {'Content-type': 'application/json; charset=UTF-8'},
          body: json.encode(task.toJson()));
      if (response.statusCode == 201) {
        print("Task Added Successfully");
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

  Future<void> deleteTask(int taskId) async {
    try {
      final response = await http.delete(Uri.parse('$apiUrl/$taskId'));
      if (response.statusCode != 200) {
        throw Exception('Failed to delete task');
      } else {
        print("Task Deleted Successfully");
      }
    } catch (e) {
      throw Exception(
          'Failed to connect to the server. Please check your internet connection.');
    }
  }

  Future<TaskModel> updateTask(TaskModel task) async {
    try {
      Uri url = Uri.parse("$apiUrl/${task.id}");

      final response = await http.put(url,
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },
          body: json.encode(task.toJson()));

      if (response.statusCode == 200) {
        print("Task Updated Successfully");
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
