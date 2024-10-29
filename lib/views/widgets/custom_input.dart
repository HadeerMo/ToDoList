import 'package:flutter/material.dart';
import 'package:to_do_app/helper/custom_borders.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.onChanged, this.controller,
  });
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      maxLength: 25,
      cursorColor: const Color.fromARGB(255, 39, 110, 50),
      decoration: InputDecoration(
        labelText: 'Add New Task',
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 1, 31, 6),
        ),
        // hintText: 'Title',
        border: customBorder(),
        enabledBorder: customBorder(),
        focusedBorder: customBorder(),
      ),
    );
  }
}
