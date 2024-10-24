import 'package:flutter/material.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/views/widgets/to_do_item.dart';

List<Task> allTasks = [
  Task(content: "Go to Work", status: true),
  Task(content: "Eat with My Family", status: false),
  Task(content: "Watch Movie", status: false),
];

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...allTasks.map(
          (item) => ToDoItem(
            text: item.content,
            status: item.status,
          ),
        ),
      ],
    );
//     return ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return const ToDoItem(
//             text: 'Publish Vedio',
//             icon: Icons.close,
//             iconColor: Color.fromARGB(255, 235, 117, 108),
//           );
//         });
  }
}
