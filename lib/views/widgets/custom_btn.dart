import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.widthOfScreen, required this.onPressed,
  });
  final double widthOfScreen;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor:
            WidgetStatePropertyAll(Color.fromARGB(255, 54, 122, 56)),
      ),
      onPressed:onPressed,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: widthOfScreen * .27, vertical: 13),
        child: const Text(
          'Add',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
