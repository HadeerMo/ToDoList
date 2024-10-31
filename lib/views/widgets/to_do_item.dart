import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubites/task_cubit/task_cubit.dart';
import 'package:to_do_app/helper/task_style.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/views/widgets/custom_icon.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    super.key,
    required this.task,
  });
  final Task task;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        BlocProvider.of<TaskCubit>(context).updateStatus(idValue: task.id, status: !task.status);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xff4c525d),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              task.content,
              style: customTextStyle(task),
            ),
            Row(
              children: [
                CustomIcon(
                  onPressed: (){
                    BlocProvider.of<TaskCubit>(context).updateStatus(idValue: task.id, status: !task.status);
                  },
                  icon: task.status ? Icons.check : Icons.close,
                  color: task.status
                      ? const Color.fromARGB(255, 107, 224, 53)
                      : const Color.fromARGB(255, 235, 117, 108),
                  size: 24,
                ),
                CustomIcon(
                  onPressed: () {
                    BlocProvider.of<TaskCubit>(context).deleteTask(task.id);
                  },
                  icon: Icons.delete,
                  color: const Color.fromARGB(255, 236, 203, 201),
                  size: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
