import 'package:flutter/material.dart';
import 'package:task_app/models/taskModel.dart';
import 'package:task_app/services/apiService.dart';

class TasksListTile extends StatefulWidget {
  final TaskModel task;

  TasksListTile({Key? key, required this.task}) : super(key: key);

  @override
  State<TasksListTile> createState() => _TasksListTileState();
}

class _TasksListTileState extends State<TasksListTile> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    return Card(
      color: isCompleted ? Colors.grey.shade200 : Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        title: Text(widget.task.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mode_edit,
                  color: Colors.green,
                ))
          ],
        ),
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: isCompleted,
              onChanged: (value) {
                setState(() {
                  isCompleted = value!;
                });
              },
            ),
            const VerticalDivider(
              width: 1,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
