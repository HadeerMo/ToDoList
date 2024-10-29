import 'package:flutter/material.dart';

class TasksCounter extends StatelessWidget {
  const TasksCounter({
    super.key,
    required this.numOfCompletedTasks,
    required this.numOfTasks,
  });

  final int numOfCompletedTasks;
  final int numOfTasks;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      '$numOfCompletedTasks/$numOfTasks',
      style: TextStyle(
        fontSize: 40,
        color:
            (numOfCompletedTasks == numOfTasks && numOfTasks!=0) ? Colors.green : Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ));
  }
}
