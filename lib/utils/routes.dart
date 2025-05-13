import 'package:flutter/material.dart';
import '../screens/onboarding_screen.dart';
import '../screens/search_screen.dart';
import '../screens/setup_profile_screen.dart';
import '../screens/art_category_screen.dart';
import '../screens/nft_detail_screen.dart';
import '../screens/analytics_screen.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String search = '/search';
  static const String setupProfile = '/setup-profile';
  static const String artCategory = '/art-category';
  static const String nftDetail = '/nft-detail';
  static const String analytics = '/analytics';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case setupProfile:
        return MaterialPageRoute(builder: (_) => SetupProfileScreen());
      case artCategory:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => ArtCategoryScreen(
            title: args['title']!,
            image: args['image']!,
            description: args['description']!,
          ),
        );
      case nftDetail:
        return MaterialPageRoute(
          builder: (_) => const NftDetailScreen(),
        );
      case analytics:
        return MaterialPageRoute(
          builder: (_) => const AnalyticsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
