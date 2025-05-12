import 'package:flutter/material.dart';
import '../models/model.dart';

class NftDetailScreen extends StatelessWidget {
  final NftModel nft;

  const NftDetailScreen({super.key, required this.nft});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nft.name),
      ),
      body: Column(
        children: [
          Image.asset(nft.imageUrl),
          Text(nft.description),
        ],
      ),
    );
  }
}