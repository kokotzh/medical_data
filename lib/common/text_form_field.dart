import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key, required this.controller, required this.text});

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (controller == controller) {
          if (value == null || value.isEmpty) {
            return "Field is required";
          }
        }
        return null;
      },
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Colors.white),
        errorStyle: const TextStyle(fontSize: 15),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0x734B4A4A),
      ),
    );
  }
}
