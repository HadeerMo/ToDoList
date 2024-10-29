import 'package:flutter/material.dart';

OutlineInputBorder customBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 39, 110, 50),
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }