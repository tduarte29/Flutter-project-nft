import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Marketplace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1D9BF0),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Gilroy'),
        ),
      ),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.onboarding,
    );
  }
}
