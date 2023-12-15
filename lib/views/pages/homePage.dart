
import 'package:flutter/material.dart';
import 'package:task_app/config/routes.dart';
import 'package:task_app/views/pages/tasksListPage.dart';

import 'addTaskPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.tasksList);
                },
                child: const Text("Tasks List")),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.addTask);
                },
                child: const Text("Add A Task")),
          ],
        ),
      ),
    );
  }
}
