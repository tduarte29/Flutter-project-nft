import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'setup_profile_screen.dart';
import 'art_category_screen.dart';
import '../widgets/featured_collections.dart';
import '../widgets/search/search_bar.dart' as custom_search;
import '../widgets/search/categories_list.dart';
import '../widgets/search/custom_bottom_navigation_bar.dart';

class SearchScreen extends StatelessWidget {
  final int selectedIndex;
  const SearchScreen({super.key, this.selectedIndex = 1});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'image': 'assets/images/art_category.png'},
      {'image': 'assets/images/collectibles_category.png'},
      {'image': 'assets/images/domains_category.png'},
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF15202B),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Search',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w700,
                fontSize: 28.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            const custom_search.SearchBar(),
            const SizedBox(height: 30.0),
            const Text(
              'Categories',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15.0),
            CategoriesList(
              categories: categories,
              onCategoryTap: (image) {
                String title = '';
                String description = '';
                String img = image;
                if (image.contains('art_category')) {
                  title = 'Art';
                  img = 'assets/images/abstract_art.png';
                  description =
                      'Karafuru is home to 5,555 generative arts where colors reign supreme. Leave the drab reality and enter the world of Karafuru by Museum of Toys.';
                } else if (image.contains('domains_category')) {
                  title = 'Domains';
                  img = 'assets/images/domains_art.png';
                  description =
                      'Explore exclusive domain NFTs and own a unique piece of the decentralized web.';
                } else if (image.contains('collectibles_category')) {
                  title = 'Collectibles';
                  img = 'assets/images/collectibles_art.png';
                  description =
                      'Discover rare digital collectibles and expand your NFT collection with unique items.';
                }
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ArtCategoryScreen(
                      title: title,
                      image: img,
                      description: description,
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 400),
                  ),
                );
              },
            ),
            const SizedBox(height: 30.0),
            const FeaturedCollections(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const OnboardingScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 400),
              ),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SetupProfileScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 400),
              ),
            );
          }
        },
      ),
    );
  }
}
