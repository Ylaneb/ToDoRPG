import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/add_task_modal.dart';
import '../widgets/tasktile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];
  int xp = 0;
  int level = 1;

  void _toggleTask(Task task) {
    setState(() {
      task.isDone = !task.isDone;
      xp += task.isDone ? 5 : -5;
      if (xp < 0) xp = 0;
      if (xp >= 100) {
        level += xp ~/ 100;
        xp = xp % 100;
      }
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      if (task.isDone) {
        xp -= 5;
        if (xp < 0) xp = 0;
      }
      tasks.remove(task);
    });
  }
  void _addTask(String title) {
    setState(() {
      tasks.add(Task(title: title));
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('XP: $xp   Level: $level'),
    ),
    body: Column(
      children: [
        // --- Retro XP Bar ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: LinearProgressIndicator(
            value: xp / 100, // fraction from 0.0 to 1.0
            minHeight: 12,
            backgroundColor: Colors.grey[900],
            valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
          ),
        ),

        // --- Task List ---
        Expanded(
          child: tasks.isEmpty
              ? const Center(child: Text('No tasks yet'))
              : ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, i) {
                    final task = tasks[i];
                    return TaskTile(
                      task: task,
                      onToggle: () => _toggleTask(task),
                      onDelete: () => _deleteTask(task),
                    );
                  },
                ),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.greenAccent,
      foregroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: const Icon(Icons.add, size: 28),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => AddTaskModal(onAdd: _addTask),
        );
      },
    ),
  );
}
}
