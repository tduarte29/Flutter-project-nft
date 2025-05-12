import 'package:flutter/material.dart';

class NftDetailScreen extends StatelessWidget {
  const NftDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF15202B),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: screenWidth > 600 ? 500.0 : 380.0, // Responsivo
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mosu_1930.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Mosu #1930',
              style: TextStyle(
                fontSize: screenWidth > 600 ? 36.0 : 28.0, // Responsivo
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}