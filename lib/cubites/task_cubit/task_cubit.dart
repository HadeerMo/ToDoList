import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/models/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  CollectionReference tasks = FirebaseFirestore.instance.collection('ToDoList');

  getAllTasks() async {
    emit(TaskLoading());
    try {
      tasks.orderBy('id').snapshots().listen((event) {
        List<Task> taskList = [];

        taskList.clear();
        for (var doc in event.docs) {
          taskList.add(Task.fromJson(doc));
        }
        emit(TaskSuccess(tasks: taskList));
      });
    } on Exception catch (e) {
      emit(TaskFailure(errorMsg: e.toString()));
    }
  }

  addTask(String content) async {
    DateTime newtaskId = DateTime.now();
    try {
      await FirebaseFirestore.instance.collection('ToDoList').add({
        'content': content,
        'status': false,
        'id': newtaskId,
      });
      // emit(TaskSuccess(tasks: tasks))
    } on Exception catch (e) {
      // TODO
    }
  }

  deleteTask(Timestamp value) async {
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

  updateStatus({required Timestamp idValue, required bool status}) async {
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

  deleteAllTasks() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('ToDoList').get();

    // Loop through each document found and update it
    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }


}
