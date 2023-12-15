import 'package:flutter/material.dart';
import '../../models/taskModel.dart';
import 'appDialog.dart';

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
    return Card(
      color: widget.task.completed ? Colors.grey.shade200 : Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        title: Text(widget.task.title,
            maxLines: 2, overflow: TextOverflow.ellipsis),
        trailing: _trailingWidgets(context),
        leading: _leadingWidgets(),
      ),
    );
  }

  Row _leadingWidgets() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: widget.task.completed,
          onChanged: (value) {
            setState(() {
              widget.task.completed = value!;
            });
          },
        ),
        const VerticalDivider(
          width: 1,
          color: Colors.black,
        ),
      ],
    );
  }

  Row _trailingWidgets(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {
              AppDialog().editDialog(
                  context, widget.task, TextEditingController(), GlobalKey());
            },
            icon: const Icon(
              Icons.mode_edit,
              color: Colors.green,
            )),
        IconButton(
            onPressed: () {
              AppDialog().deleteDialog(context, widget.task);
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            )),
      ],
    );
  }
}
