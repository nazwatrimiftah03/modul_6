import 'package:flutter/material.dart';
import 'package:modul_6/services/firestore_service.dart';
import 'package:modul_6/widgets/todo_dialog.dart';

import '../widgets/todo_item.dart';

class TodoScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: StreamBuilder(
          stream: _firestoreService.getTodos(),
          builder: (context, snapshot){
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Belum ada tugas.'));
            }
            final todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoItem(
                  todo: todos[index],
                  firestoreService: _firestoreService,
                );
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => TodoDialog(firestoreService: _firestoreService),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}