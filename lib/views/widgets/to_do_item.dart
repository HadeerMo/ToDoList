import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    super.key,
    required this.text,
    required this.status,
    this.onPressedStatus, this.onPressedDelete,
    // required this.icon,
    // required this.iconColor,
  });
  final String text;
  final bool status;
  final void Function()? onPressedStatus;
  final void Function()? onPressedDelete;
  // final IconData icon;
  // final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xff4c525d),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: customTextStyle(),
            ),
            Row(
              children: [
                CustomIcon(
                  onPressed: onPressedStatus,
                  icon: status ? Icons.check : Icons.close,
                  color: status
                      ? const Color.fromARGB(255, 107, 224, 53)
                      : const Color.fromARGB(255, 235, 117, 108),
                ),
                CustomIcon(
                  onPressed: onPressedDelete,
                  icon: Icons.delete,
                  color: const Color.fromARGB(255, 236, 203, 201),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle customTextStyle() => TextStyle(color: status? Colors.black: Colors.white, fontSize: 16,decoration: status?TextDecoration.lineThrough: TextDecoration.none );
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.onPressed,
    required this.color,
    required this.icon,
  });

  final void Function()? onPressed;
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
