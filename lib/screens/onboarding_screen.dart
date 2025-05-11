import 'package:flutter/material.dart';
import 'search_screen.dart';

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
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Image.asset(
                      _pages[index]['image']!,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
          // Container fixo com conteúdo
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 280,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF252B41),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _pages[_currentPage]['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 28.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _pages[_currentPage]['subtitle']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  ElevatedButton(
                    onPressed: _isAnimating
                        ? null
                        : () {
                            if (_currentPage < _pages.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      const SearchScreen(selectedIndex: 1),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D9BF0),
                      disabledBackgroundColor: const Color(0xFF1D9BF0),
                      disabledForegroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      _currentPage < _pages.length - 1 ? 'Next' : 'Get Started',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _pages.length; i++) {
      indicators.add(
        Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == _currentPage
                ? const Color(0xFFFFFFFF)
                : const Color(0xFF1C212B),
          ),
        ),
      );
    }
    return indicators;
  }
}