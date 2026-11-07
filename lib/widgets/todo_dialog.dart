import 'package:flutter/material.dart';
import 'package:modul_6/services/firestore_service.dart';

class TodoDialog extends StatefulWidget {
  final FirestoreService firestoreService;
  const TodoDialog({
    super.key,
    required this.firestoreService,
  });

  @override
  State<TodoDialog> createState() => _TodoDialogState();
}

class _TodoDialogState extends State<TodoDialog> {
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Todo'),
      content: TextField(
        controller: _taskController,
        autofocus: true,
        decoration: InputDecoration(hintText: 'Add new task'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_taskController.text.trim().isNotEmpty) {
              widget.firestoreService.addTodo(_taskController.text.trim());
              Navigator.pop(context);
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}