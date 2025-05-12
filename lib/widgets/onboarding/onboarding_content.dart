import 'package:flutter/material.dart';
import 'onboarding_page_indicator.dart';

class OnboardingContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final int currentPage;
  final int pageCount;
  final bool isAnimating;
  final VoidCallback onNext;
  final VoidCallback onGetStarted;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.currentPage,
    required this.pageCount,
    required this.isAnimating,
    required this.onNext,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w700,
              fontSize: 28.0,
              color: Colors.white,
            ),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          OnboardingPageIndicator(
            currentPage: currentPage,
            pageCount: pageCount,
          ),
          ElevatedButton(
            onPressed: isAnimating
                ? null
                : currentPage < pageCount - 1
                    ? onNext
                    : onGetStarted,
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
              currentPage < pageCount - 1 ? 'Next' : 'Get Started',
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
    );
  }
}
