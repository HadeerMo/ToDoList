import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    super.key,
    required this.text,
    required this.status,
    // required this.icon,
    // required this.iconColor,
  });
  final String text;
  final bool status;
  // final IconData icon;
  // final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  status ? Icons.check : Icons.close,
                  color: status
                      ? const Color.fromARGB(255, 107, 224, 53)
                      : const Color.fromARGB(255, 235, 117, 108),
                ))
          ],
        ),
      ),
    );
  }
}
