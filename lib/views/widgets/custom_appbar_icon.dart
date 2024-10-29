import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  const CustomAppBarIcon({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.delete_forever),
      style: const ButtonStyle(
        iconColor: WidgetStatePropertyAll(
          Color.fromARGB(255, 236, 203, 201),
        ),
        iconSize: WidgetStatePropertyAll(30),
      ),
    );
  }
}