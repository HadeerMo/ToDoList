import 'package:flutter/material.dart';
import 'package:to_do_app/models/task.dart';

TextStyle customTextStyle(Task task) {
  return TextStyle(
      color: task.status ? Colors.black : Colors.white,
      fontSize: 16,
      decoration:
          task.status ? TextDecoration.lineThrough : TextDecoration.none);
}
