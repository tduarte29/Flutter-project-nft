import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/onboarding_item.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.item});

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 80),
          _buildImage(),
          const SizedBox(height: 60),
          _buildTitle(),
          const SizedBox(height: 20),
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: SvgPicture.asset(item.imagePath, fit: BoxFit.contain),
    );
  }

  Widget _buildTitle() {
    return Text(
      item.title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      item.description,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white70, fontSize: 16),
    );
  }
}
