import 'package:flutter/material.dart';
import 'package:modul_6/services/firestore_service.dart';

import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final FirestoreService firestoreService;

  const TodoItem({
    super.key,
    required this.todo,
    required this.firestoreService,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      // Tambahkan onDismissed agar data terhapus saat di-swipe
      onDismissed: (direction) {
        firestoreService.deleteTodo(todo.id);
      },
      child: CheckboxListTile(
        title: Text(
          todo.task,
          style: TextStyle(
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        value: todo.isDone,
        onChanged: (_) => firestoreService.updateTodoStatus(todo.id, todo.isDone),
      ),
    );
  }
}