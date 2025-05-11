import 'package:flutter/material.dart';
import 'features/onboarding/presentation/pages/onboarding_page.dart';
import 'features/search/presentation/pages/search_page.dart';
import 'features/profile/presentation/pages/setup_profile_page.dart';
import 'features/nft_item/presentation/pages/nft_item_page.dart';
import 'features/search/presentation/pages/collection_page.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String search = '/search';
  static const String setupProfile = '/setup-profile';
  static const String nftItem = '/nft-item';
  static const String collection = '/collection';

  static Map<String, WidgetBuilder> get routes => {
    onboarding: (context) => const OnboardingPage(),
    search: (context) => const SearchPage(),
    setupProfile: (context) => const SetupProfilePage(),
    nftItem: (context) => const NFTItemPage(),
    collection: (context) => const CollectionPage(),
  };
}
