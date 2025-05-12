import 'package:flutter/material.dart';

class ProfileBioField extends StatelessWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final bool enabled;

  const ProfileBioField({
    super.key,
    this.initialValue,
    this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF252B41),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: controller,
        enabled: enabled,
        maxLines: 3,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Bio',
          hintStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
