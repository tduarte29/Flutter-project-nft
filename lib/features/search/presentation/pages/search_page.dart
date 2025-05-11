import 'package:flutter/material.dart';
import '../../../../shared/widgets/bottom_navigation_bar.dart';
import '../../../../theme/app_colors.dart';
import '../../../../routes.dart';
import '../widgets/collection_card.dart';
import '../../../../core/constants/mock_data.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Search your NFT...',
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.subtext,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  fillColor: Color(0xFF21212A),
                ),
              ),
              const SizedBox(height: 24),

              // Categories
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Categories Grid (just showing Art category for now)
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.collection);
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.cardBackground,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/art_category.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Art',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Featured Collections
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Featured Collections',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Featured Collections List
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: MockData.collections.map((collection) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CollectionCard(
                        collection: collection,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.collection,
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 1),
    );
  }
}
