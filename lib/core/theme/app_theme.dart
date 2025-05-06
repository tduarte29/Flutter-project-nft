import 'package:flutter/material.dart';
import '../constansts/app_colors.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: AppColors.background,
  );
}
