import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/models/task.dart';
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

// CollectionReference tasks = FirebaseFirestore.instance.collection('ToDoList');
Future<void> addTask(String content) async {
  // Random random = Random();
  DateTime newtaskId = DateTime.now();
  await FirebaseFirestore.instance.collection('ToDoList').add({
    'content': content,
    'status': false,
    'id': newtaskId,
  });
}

// .orderBy(kCreatedAt, descending: true)
Future<List<Task>> getAllTasks() async {
  List<Task> tasksList = [];
  CollectionReference tasks = FirebaseFirestore.instance.collection('ToDoList');
  QuerySnapshot snapshot = await tasks.get();
  tasksList = snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList();
  tasksList.sort((a, b) => a.id.compareTo(b.id));
  return tasksList;
}

Future<void> deleteTask(Timestamp value) async {
  // Query the collection to find the document with the unique field
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('ToDoList')
      .where('id', isEqualTo: value)
      .get();

  // Check if the document exists
  if (querySnapshot.docs.isNotEmpty) {
    for (var doc in querySnapshot.docs) {
      await doc.reference.delete(); // Delete the document
    }
  }
}

Future<void> updateStatus(
    {required Timestamp idValue, required bool status}) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('ToDoList')
      .where('id', isEqualTo: idValue)
      .get();

  // Loop through each document found and update it
  for (var doc in querySnapshot.docs) {
    await doc.reference.update({
      'status': status, // Update any field you want
    });
  }
}

Future<void> deleteAllTasks() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('ToDoList').get();

  // Loop through each document found and update it
  for (var doc in querySnapshot.docs) {
    await doc.reference.delete();
  }
}
