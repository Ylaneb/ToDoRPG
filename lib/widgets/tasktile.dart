import 'package:flutter/material.dart';
import '../models/task.dart';

/// A single row displaying a task with a checkbox and delete icon.
class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskTile({
    Key? key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(color: Colors.greenAccent, width: 2),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          task.title,
          // decoration based on done state still applies via Theme text style
          style: TextStyle(
            decoration:
                task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          color: Colors.redAccent,
          onPressed: onDelete,
        ),
      ),
    );
    // ← up to here, instead of the old ListTile(...) return.
  }
}
