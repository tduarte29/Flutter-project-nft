import 'package:flutter/material.dart';

class OnboardingImagePage extends StatelessWidget {
  final String imagePath;
  const OnboardingImagePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Image.asset(
          imagePath,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
