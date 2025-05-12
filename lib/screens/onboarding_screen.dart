import 'package:flutter/material.dart';
import 'search_screen.dart';
import '../widgets/onboarding/onboarding_image_page.dart';
import '../widgets/onboarding/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isAnimating = false;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/marketplace.png',
      'title': 'Discover largest\nNFT marketplace',
      'subtitle': 'Buy and sell digital items'
    },
    {
      'image': 'assets/images/digital.png',
      'title': 'Start your own\nNFT gallery now',
      'subtitle': 'Buy and sell digital items'
    },
    {
      'image': 'assets/images/discover.png',
      'title': 'Discovering the\nworld of crypto art',
      'subtitle': 'Buy and sell digital items'
    },
  ];

  void _changePage(int page) {
    if (_isAnimating) return;

    setState(() {
      _isAnimating = true;
      _currentPage = page;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isAnimating = false;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15202B),
      body: Stack(
        children: [
          // PageView apenas para as imagens
          Padding(
            padding: const EdgeInsets.only(bottom: 280.0),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _changePage,
              physics: _isAnimating
                  ? const NeverScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return OnboardingImagePage(imagePath: _pages[index]['image']!);
              },
            ),
          ),
          // Container fixo com conteúdo
          Align(
            alignment: Alignment.bottomCenter,
            child: OnboardingContent(
              title: _pages[_currentPage]['title']!,
              subtitle: _pages[_currentPage]['subtitle']!,
              currentPage: _currentPage,
              pageCount: _pages.length,
              isAnimating: _isAnimating,
              onNext: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              onGetStarted: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const SearchScreen(selectedIndex: 1),
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
          ),
        ],
      ),
    );
  }
}
