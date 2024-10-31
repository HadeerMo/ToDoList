import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubites/task_cubit/task_cubit.dart';
import 'package:to_do_app/helper/custom_dialog.dart';
import 'package:to_do_app/views/widgets/custom_icon.dart';
import 'package:to_do_app/views/widgets/home_view_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    double hightOfScreen = MediaQuery.of(context).size.height;
    BlocProvider.of<TaskCubit>(context).getAllTasks();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff272c39),
        appBar: AppBar(
          actions: [
            CustomIcon(
              onPressed: () async {
                BlocProvider.of<TaskCubit>(context).deleteAllTasks();
              },
              icon: Icons.delete_forever,
              color: const Color.fromARGB(255, 236, 203, 201),
              size: 30,
            ),
          ],
          backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
          title: const Text(
            'To Do App',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: HomePageBody(),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              customDialog(
                context,
                hightOfScreen,
                widthOfScreen,
              );
            },
            shape: const CircleBorder(),
            backgroundColor: Colors.redAccent,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
    );
  }
}
