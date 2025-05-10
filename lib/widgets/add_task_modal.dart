import 'package:flutter/material.dart';

class AddTaskModal extends StatefulWidget {
  final void Function(String) onAdd;
  const AddTaskModal({Key? key, required this.onAdd}) : super(key: key);

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onAdd(text);
    Navigator.of(context).pop();
  }

 @override
Widget build(BuildContext context) {
  final bottomInset = MediaQuery.of(context).viewInsets.bottom;
  return Card(
    color: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
      side: BorderSide(color: Colors.greenAccent, width: 2),
    ),
    margin: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 16),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Text('New Task', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),

          // Input field
          TextField(
            controller: _controller,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Task title',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 2),
              ),
            ),
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 8),

          // Add button
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Add'),
          ),
        ],
      ),
    ),
  );
}

}