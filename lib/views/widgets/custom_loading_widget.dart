import 'package:flutter/material.dart';
import 'package:to_do_app/views/widgets/tasks_counter.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TasksCounter(numOfCompletedTasks: 0, numOfTasks: 0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ],
    );
  }
}