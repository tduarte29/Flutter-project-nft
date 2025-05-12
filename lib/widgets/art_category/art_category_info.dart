import 'package:flutter/material.dart';

class ArtCategoryInfo extends StatelessWidget {
  final String title;
  final String description;

  const ArtCategoryInfo({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            fontSize: 32.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 18.0),
        Text(
          description,
          style: const TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
