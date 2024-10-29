import 'package:flutter/material.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/views/widgets/tasks_counter.dart';
import 'package:to_do_app/views/widgets/to_do_item.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key, required this.allTasks});
  final List<Task> allTasks;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    int numOfTasks = widget.allTasks.length;
    int numOfCompletedTasks =
        widget.allTasks.where((n) => n.status == true).toList().length;

    // return
    // ListView(
    //   children: [
    //     TasksCounter(
    //         numOfCompletedTasks: numOfCompletedTasks, numOfTasks: numOfTasks),
    //     ...allTasks.map(
    //       (item) => ToDoItem(

    //         text: item.content,
    //         status: item.status,
    //       ),
    //     ),
    //   ],
    // );
    return Column(
      children: [
        TasksCounter(
            numOfCompletedTasks: numOfCompletedTasks, numOfTasks: numOfTasks),
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.allTasks.length,
              itemBuilder: (context, index) {
                return ToDoItem(
                  onPressedStatus: () {
                    widget.allTasks[index].status =
                        !widget.allTasks[index].status;
                    setState(() {});
                  },
                  onPressedDelete: () {
                    widget.allTasks.removeAt(index);
                    setState(() {});
                  },
                  text: widget.allTasks[index].content,
                  status: widget.allTasks[index].status,
                );
              }),
        ),
      ],
    );
  }
}
