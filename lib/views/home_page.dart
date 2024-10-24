import 'package:flutter/material.dart';
import 'package:to_do_app/views/widgets/home_view_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff272c39),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
          elevation: 0,
          title: const Text(
            'To Do App',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25,
              fontFamily: AutofillHints.transactionAmount
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: HomePageBody(),
        ),
      ),
    );
  }
}
