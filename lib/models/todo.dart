import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String id;
  final String task;
  final bool isDone;
  final Timestamp? createdAt;

  Todo({
    required this.id,
    required this.task,
    required this.isDone,
    this.createdAt
  });

  // Firestore -> Object Flutter (Todo)
  factory Todo.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Todo(
        id: doc.id,
        task: data['task'] as String,
        isDone: data['isDone'] as bool,
        createdAt: data['createdAt'] as Timestamp?
    );
  }

  // Objek Flutter -> Firestore
  Map<String, dynamic> toMap(){
    return {
      'task': task,
      'isDone': isDone,
      'createdAt': createdAt ?? FieldValue.serverTimestamp()
    };
  }
}