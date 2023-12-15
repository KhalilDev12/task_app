import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/taskProvider.dart';
import '../../models/taskModel.dart';
import '../widgets/appTextField.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() {
    return _AddTaskPageState();
  }
}

class _AddTaskPageState extends State<AddTaskPage> {
  late double deviceHeight, deviceWidth;
  bool isCompleted = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Task"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(
                      title: "Enter the Title of the Task",
                      controller: titleController),
                  SizedBox(height: deviceHeight * 0.05),
                  AppTextField(
                    title: "Enter the Description of the Task",
                    controller: descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                  ),
                  SizedBox(height: deviceHeight * 0.05),
                  _completedCheckBox(),
                  SizedBox(height: deviceHeight * 0.05),
                  Center(child: _addTaskButton(taskProvider, context))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _completedCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Have you complete this Task?",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Checkbox(
          value: isCompleted,
          onChanged: (value) {
            setState(() {
              isCompleted = !isCompleted;
            });
          },
        )
      ],
    );
  }

  ElevatedButton _addTaskButton(
      TaskProvider taskProvider, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            TaskModel task = TaskModel(
                userId: 1,
                id: 1,
                title: titleController.text,
                completed: isCompleted);

            taskProvider
                .addTask(task)
                .whenComplete(
                  () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Task Added Successfully"),
                      duration: Duration(seconds: 2),
                    ),
                  ),
                )
                .whenComplete(() => Navigator.pop(context));
          }
        },
        child: const Text("Add Task"));
  }
}
