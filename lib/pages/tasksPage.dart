import 'package:flutter/material.dart';
import 'package:task_app/models/taskModel.dart';
import 'package:task_app/services/apiService.dart';

class TasksPage extends StatefulWidget {
  TasksPage({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() {
    return _TasksPageState();
  }
}

class _TasksPageState extends State<TasksPage> {
  final ApiService apiService = ApiService();
  late Future<List<TaskModel>> _tasks;

  @override
  void initState() {
    super.initState();
    _tasks = apiService.getTasks();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks List"), centerTitle: true),
      body: FutureBuilder(
        future: _tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<TaskModel> tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index].title),
                  trailing: Checkbox(
                    value: tasks[index].completed,
                    onChanged: (value) {
                      // Implement task completion logic
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
