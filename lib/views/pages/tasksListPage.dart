import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/taskProvider.dart';
import '../../services/apiService.dart';
import '../widgets/tasksListTile.dart';

class TasksListPage extends StatefulWidget {
  TasksListPage({Key? key}) : super(key: key);

  @override
  _TasksListPageState createState() {
    return _TasksListPageState();
  }
}

class _TasksListPageState extends State<TasksListPage> {
  final ApiService apiService = ApiService();
  late TaskProvider taskProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
        appBar: AppBar(title: const Text("Tasks List"), centerTitle: true),
        body: RefreshIndicator(
            onRefresh: _onRefresh,
            child: taskProvider.tasks.isNotEmpty
                ? ListView.builder(
                    itemCount: taskProvider.tasks.length,
                    itemBuilder: (context, index) {
                      final task = taskProvider.tasks[index];
                      return TasksListTile(task: task);
                    },
                  )
                : const Center(
                    child: Text('No tasks available.'),
                  )));
  }

  Future<void> _onRefresh() async {
    await taskProvider.getTasks();
  }
}
