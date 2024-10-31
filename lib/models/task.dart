import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String content;
  bool status;
  Timestamp id;
  Task({
    required this.content,
    required this.status,
    required this.id,
  });

  factory Task.fromJson(jsonData) {
    return Task(content: jsonData['content'], status: jsonData['status'],id: jsonData['id']);
  }
}
