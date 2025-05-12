import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'setup_profile_screen.dart';
import 'art_category_screen.dart';
import '../components/featured_collections.dart';

class SearchScreen extends StatelessWidget {
  final int selectedIndex;
  const SearchScreen({super.key, this.selectedIndex = 1});

  @override
  Widget build(BuildContext context) {
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF252B41),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const TextField(
                style: TextStyle(
                  color: Color(0xFFAAB8C2),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
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
            ),
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
            SizedBox(
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildCategoryCard(
                    context: context,
                    image: 'assets/images/art_category.png',
                    title: '',
                  ),
                  const SizedBox(width: 10.0),
                  _buildCategoryCard(
                    context: context,
                    image: 'assets/images/collectibles_category.png',
                    title: '',
                  ),
                  const SizedBox(width: 10.0),
                  _buildCategoryCard(
                    context: context,
                    image: 'assets/images/domains_category.png',
                    title: '',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            const FeaturedCollections(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, selectedIndex),
    );
  }

  Widget _buildCategoryCard({
    required BuildContext context,
    required String image,
    required String title,
  }) {
    return GestureDetector(
      onTap: () {
        String description = '';
        if (image.contains('art_category')) {
          title = 'Art';
          image = 'assets/images/abstract_art.png';
          description = 'Karafuru is home to 5,555 generative arts where colors reign supreme. Leave the drab reality and enter the world of Karafuru by Museum of Toys.';
        } else if (image.contains('domains_category')) {
          title = 'Domains';
          image = 'assets/images/domains_art.png';
          description = 'Explore exclusive domain NFTs and own a unique piece of the decentralized web.';
        } else if (image.contains('collectibles_category')) {
          title = 'Collectibles';
          image = 'assets/images/collectibles_art.png';
          description = 'Discover rare digital collectibles and expand your NFT collection with unique items.';
        }

        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => ArtCategoryScreen(
              title: title,
              image: image,
              description: description,
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 400),
          ),
        );
      },
      child: Container(
        width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, int currentIndex) {
    const Color unselectedColor = Color(0xFFAAB8C2);
    const Color selectedColor = Color(0xFF1D9BF0);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF252B41), width: 1.0),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFF15202B),
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // alterado
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), // alterado
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart), // alterado
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // alterado
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const OnboardingScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
                pageBuilder: (context, animation, secondaryAnimation) => SetupProfileScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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