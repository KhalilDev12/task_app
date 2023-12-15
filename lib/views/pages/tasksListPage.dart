import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/taskProvider.dart';
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
  late double deviceHeight, deviceWidth;

  bool isRefreshing = false;

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
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: _appBar(),
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
                : Center(
                    child: isRefreshing
                        ? const CircularProgressIndicator()
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('No tasks available.'),
                              SizedBox(height: deviceHeight * 0.01),
                              IconButton(
                                  onPressed: () {
                                    _onRefresh();
                                  },
                                  icon: Icon(
                                    color: Colors.green,
                                    Icons.refresh,
                                    size: deviceHeight * 0.05,
                                  ))
                            ],
                          ),
                  )));
  }

  AppBar _appBar() => AppBar(backgroundColor:Colors.white,title: const Text("Tasks List"), centerTitle: true);

  Future<void> _onRefresh() async {
    setState(() {
      isRefreshing = true;
    });
    await taskProvider.getTasks();
    setState(() {
      isRefreshing = false;
    });
  }
}
