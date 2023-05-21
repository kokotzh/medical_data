import 'package:flutter/material.dart';

class AppBtn extends StatelessWidget {
  const AppBtn({super.key, required this.onPressed, required this.text});

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    ButtonStyle btnStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0x734B4A4A)),
    );
    return ElevatedButton(
      onPressed: onPressed,
      style: btnStyle,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
