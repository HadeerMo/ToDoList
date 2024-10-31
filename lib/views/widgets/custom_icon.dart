import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.onPressed,
    required this.color,
    required this.icon, required this.size,
  });

  final void Function()? onPressed;
  final Color color;
  final IconData icon;
  final double size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
      style: ButtonStyle(iconSize: WidgetStatePropertyAll(size),),
    );
  }
}
