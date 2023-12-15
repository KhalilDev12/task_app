
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/taskProvider.dart';
import '../../models/taskModel.dart';
import 'appTextField.dart';


class AppDialog {
  Future deleteDialog(BuildContext context, TaskModel task) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.warning, color: Colors.red),
        content: const Text("Are you sure you want to delete this Task?",
            textAlign: TextAlign.center),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<TaskProvider>()
                        .deleteTask(task)
                        .whenComplete(
                          () => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Task Deleted Successfully"),
                              duration: Duration(seconds: 2),
                            ),
                          ),
                        )
                        .whenComplete(() => Navigator.pop(context));
                  },
                  child: const Text("Yes")),
              _cancelButton(context)
            ],
          )
        ],
      ),
    );
  }

  Future editDialog(BuildContext context, TaskModel task,
      TextEditingController controller, GlobalKey<FormState> formKey) {
    bool isCompleted = task.completed;
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          controller.text = task.title;
          return AlertDialog(
            icon: const Icon(Icons.change_circle, color: Colors.green),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(
                      title: "Enter new title for the task",
                      controller: controller,
                      maxLines: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Check if Completed"),
                      Checkbox(
                        value: isCompleted,
                        onChanged: (value) {
                          setState(() => isCompleted = !isCompleted);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        task.title = controller.text;
                        task.completed = isCompleted;
                        context
                            .read<TaskProvider>()
                            .updateTask(task)
                            .whenComplete(
                              () => ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Task Updated Successfully"),
                                  duration: Duration(seconds: 2),
                                ),
                              ),
                            )
                            .whenComplete(() => Navigator.pop(context));
                      }
                    },
                    child: const Text("Update"),
                  ),
                  _cancelButton(context)
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

TextButton _cancelButton(BuildContext context) {
  return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text("Cancel"));
}
