import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_app/models/taskModel.dart';

class ApiService {
  late final String apiUrl;

  ApiService() {
    apiUrl = "https://jsonplaceholder.typicode.com/todos";
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
}
