import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  const SearchBar({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF252B41),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          color: Color(0xFFAAB8C2),
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
        decoration: const InputDecoration(
          icon: Icon(Icons.search, color: Color(0xFFAAB8C2)),
          hintText: 'Search your NFT...',
          hintStyle: TextStyle(
            color: Color(0xFFAAB8C2),
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
