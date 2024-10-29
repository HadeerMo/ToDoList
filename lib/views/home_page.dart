import 'package:flutter/material.dart';
import 'package:to_do_app/helper/custom_dialog.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/views/widgets/custom_appbar_icon.dart';
import 'package:to_do_app/views/widgets/home_view_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String value = '';
  List<Task> allTasks = [
    Task(content: "Go to Work", status: true),
    Task(content: "Eat with My Family", status: false),
    Task(content: "Watch Movie", status: false),
  ];

  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    double hightOfScreen = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff272c39),
        appBar: AppBar(
          actions: [
            CustomAppBarIcon(
              onPressed: () {
                allTasks.clear();
                setState(() {});
              },
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: HomePageBody(
            allTasks: allTasks,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // showCustomBottomSheet(
              //   controller: myController,
              //   context,
              //   hightOfScreen,
              //   widthOfScreen,
              //   onPressed: () {
              //     addToList(myController.text);
              //   },
              // );

              customDialog(
                context,
                hightOfScreen,
                widthOfScreen,
                controller: myController,
                onPressed: () {
                  addToList(myController.text);
                },
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

  void addToList(String value) {
    allTasks.add(
      Task(content: value, status: false),
    );
    setState(() {});
    Navigator.pop(context);
    myController.text = '';
  }
}
