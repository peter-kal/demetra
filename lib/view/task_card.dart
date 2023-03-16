import 'package:flutter/material.dart';
import 'package:demetra/model/task.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TaskCard(
      {required this.task, required this.onDelete, required this.onEdit});

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Text('data'),
            title: Text(widget.task.name),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: () => widget.onEdit, child: Text('Edit')),
              const SizedBox(
                width: 8,
              ),
              TextButton(
                  onPressed: () => widget.onDelete, child: Text('Delete')),
            ],
          )
        ],
      ),
    );
  }
}
