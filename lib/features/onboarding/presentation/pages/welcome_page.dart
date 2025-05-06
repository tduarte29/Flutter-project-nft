import 'package:flutter/material.dart';
import '../../models/onboarding_item.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/page_indicator.dart';
import '../widgets/next_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const List<OnboardingItem> _items = [
    OnboardingItem(
      title: 'Discover largest\nNFT marketplace',
      description: 'Buy and sell digital items',
      imagePath: 'assets/image1.svg',
    ),
    OnboardingItem(
      title: 'Start your own\nNFT gallery now',
      description: 'Buy and sell digital items',
      imagePath: 'assets/image2.svg',
    ),
    OnboardingItem(
      title: 'Discovering the\nworld of crypto art',
      description: 'Buy and sell digital items',
      imagePath: 'assets/image3.svg',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1E26),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: _items.length,
                itemBuilder: (_, index) => OnboardingPage(item: _items[index]),
              ),
            ),
            PageIndicator(itemCount: _items.length, currentPage: _currentPage),
            NextButton(onPressed: _nextPage),
          ],
        ),
      ),
    );
  }
}
