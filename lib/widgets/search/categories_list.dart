import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoriesList extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final void Function(String image) onCategoryTap;
  const CategoriesList(
      {super.key, required this.categories, required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10.0),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return CategoryCard(
            image: cat['image'],
            onTap: () => onCategoryTap(cat['image']),
          );
        },
      ),
    );
  }
}
