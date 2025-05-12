import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const ProfileTextField({
    super.key,
    required this.hintText,
    this.initialValue,
    this.validator,
    this.enabled = true,
    this.keyboardType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      enabled: enabled,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFAAB8C2)),
        filled: true,
        fillColor: const Color(0xFF252B41),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      validator: validator,
    );
  }
}
