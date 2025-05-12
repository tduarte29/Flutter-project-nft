import 'package:flutter/material.dart';

class ProfilePhotoUploader extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onUpload;
  const ProfilePhotoUploader({
    super.key,
    required this.imagePath,
    this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: const Color(0xFF252B41),
              width: 2.0,
            ),
          ),
        ),
        GestureDetector(
          onTap: onUpload,
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF1D9BF0),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
