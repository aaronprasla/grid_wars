import 'package:flutter/material.dart';

class PlayerInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final IconData icon;

  const PlayerInput({
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
            controller: controller,
            onChanged: onChanged,
          ),
        ),
        Icon(icon, color: Colors.grey),
      ],
    );
  }
}
