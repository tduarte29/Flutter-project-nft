import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme/app_theme.dart';

class NFTMarketplaceApp extends StatelessWidget {
  const NFTMarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Marketplace',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding,
      routes: AppRoutes.routes,
    );
  }
}
