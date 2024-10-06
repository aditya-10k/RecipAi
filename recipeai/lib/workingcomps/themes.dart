import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

// Define minimal colors for light and dark themes
class AppColors {
  // Light theme colors
  static const Color primaryLight = Colors.black;
  static const Color backgroundLight = Colors.white;
  static  Color surfaceLight = Colors.grey[100]!;
  static const Color onPrimaryLight = Colors.white;
  static const Color onBackgroundLight = Colors.black;
  static const Color onSurfaceLight = Colors.black;

  // Dark theme colors
  static const Color primaryDark = Colors.white;
  static const Color backgroundDark = Colors.black;
   Color surfaceDark = Colors.grey[850]!;
  static const Color onPrimaryDark = Colors.black;
  static const Color onBackgroundDark = Colors.white;
  static  Color onSurfaceDark = Colors.white;
}

// Define text styles using Google Fonts
class AppTextStyles {
  static TextStyle headline1 = GoogleFonts.lato(
    fontSize: 40.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
    color: AppColors.onBackgroundLight,
  );
  static TextStyle headline2 = GoogleFonts.lato(
    fontSize: 30.0,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
    color: AppColors.onBackgroundLight,
  );
  static TextStyle bodyText1 = GoogleFonts.lato(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: AppColors.onBackgroundLight,
  );
  static TextStyle bodyText2 = GoogleFonts.lato(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: AppColors.onBackgroundLight,
  );
}

// Light theme configuration
ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    //backgroundColor: AppColors.backgroundLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    //surfaceColor: AppColors.surfaceLight,
    appBarTheme: AppBarTheme(
      color: AppColors.backgroundLight,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryLight),
      titleTextStyle: AppTextStyles.headline1.copyWith(color: AppColors.primaryLight),
    ),
    textTheme: TextTheme(
      titleLarge: AppTextStyles.headline1,
      titleMedium: AppTextStyles.headline2,
      bodyMedium: AppTextStyles.bodyText1,
      bodySmall: AppTextStyles.bodyText2,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryLight,
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight,
      labelStyle: TextStyle(color: AppColors.onSurfaceLight),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.onSurfaceLight),
      ),
    ),
  );
}

// Dark theme configuration
ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    //backgroundColor: AppColors.backgroundDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
   // surfaceColor: AppColors.surfaceDark,
    appBarTheme: AppBarTheme(
      color: AppColors.backgroundDark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryDark),
      titleTextStyle: AppTextStyles.headline1.copyWith(color: AppColors.primaryDark),
    ),
    textTheme: TextTheme(
      titleLarge: AppTextStyles.headline1.copyWith(color: AppColors.onBackgroundDark),
      titleMedium: AppTextStyles.headline2.copyWith(color: AppColors.onBackgroundDark),
      bodyMedium: AppTextStyles.bodyText1.copyWith(color: AppColors.onBackgroundDark),
      bodySmall: AppTextStyles.bodyText2.copyWith(color: AppColors.onBackgroundDark),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryDark,
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[850],
      labelStyle: TextStyle(color: AppColors.onSurfaceDark),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.onSurfaceDark),
      ),
    ),
  );
}

