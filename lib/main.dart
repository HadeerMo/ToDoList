import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubites/task_cubit/task_cubit.dart';
import 'package:to_do_app/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCq0uXCi7Avfh26TDH8BQh5F2zBoOwT7Gs",
        appId: "1:1031363570940:web:6558ca80643a3b32257b79",
        messagingSenderId: "1031363570940",
        projectId: "todoapp-ea4d5",
        storageBucket: "todoapp-ea4d5.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => const HomePage(),
        },
      ),
    );
  }
}
