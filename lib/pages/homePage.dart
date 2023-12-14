import 'package:flutter/material.dart';
import 'package:task_app/models/taskModel.dart';
import 'package:task_app/pages/tasksPage.dart';
import 'package:task_app/services/apiService.dart';

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
    bool? isChecked =
        true; // This holds the state of the checkbox, we call setState and update this whenever a user taps the checkbox
    ApiService apiService = ApiService();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TasksPage(),
                ));
              },
              child: Text("Task List"),
            ),
            ElevatedButton(
              onPressed: () {
                apiService.deleteTask(1);
              },
              child: Text("Delete List"),
            ),
            ElevatedButton(
              onPressed: () async {
                TaskModel task = await apiService.updateTask(TaskModel(
                    userId: 1, id: 1, title: "Hello Again", completed: true));
              },
              child: Text(" Update Task List"),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                // This is where we update the state when the checkbox is tapped
                setState(() {
                  isChecked =value;
                  print(isChecked);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
