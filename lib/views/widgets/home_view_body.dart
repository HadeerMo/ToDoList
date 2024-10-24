import 'package:flutter/material.dart';
import 'package:to_do_app/views/widgets/to_do_item.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ToDoItem(
            text: 'Publish Vedio',
            icon: Icons.close,
            iconColor: Color.fromARGB(255, 235, 117, 108),
          );
        });
  }
}
