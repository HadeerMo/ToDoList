import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubites/task_cubit/task_cubit.dart';
import 'package:to_do_app/helper/crud_operations.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/views/widgets/custom_loading_widget.dart';
import 'package:to_do_app/views/widgets/tasks_counter.dart';
import 'package:to_do_app/views/widgets/to_do_item.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> allTasks =[];
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is TaskSuccess) {
          allTasks = state.tasks;
        }
      },
      builder: (context, state) {
        if (state is TaskFailure) {
          return const CustomLoadingWidget();
        } else if (state is TaskSuccess) {
          return Column(
            children: [
              TasksCounter(
                numOfCompletedTasks:
                    allTasks.where((t) => t.status == true).toList().length,
                numOfTasks: allTasks.length,
              ),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: allTasks.length,
                    itemBuilder: (context, index) {
                      return ToDoItem(
                        task: allTasks[index],
                      );
                    }),
              ),
            ],
          );
        } else if(state is TaskFailure) {
          return Text(state.errorMsg);
        }
        else{
            return const CustomLoadingWidget();
        }
      },
    );
  }
}
