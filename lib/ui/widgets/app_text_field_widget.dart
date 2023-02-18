import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          filled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
