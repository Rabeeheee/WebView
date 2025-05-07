import 'package:flutter/material.dart';

class AppTheme {
  // Black and white theme colors
  static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Colors.white;
  static const Color accentColor = Color(0xFF333333);
  static const Color backgroundLight = Colors.white;
  static const Color textDark = Colors.black;
  static const Color textLight = Colors.white;
  static const Color textGrey = Color(0xFF757575);
  static const Color inputBackground = Color(0xFFF5F5F5);
  static const Color borderColor = Color(0xFFE0E0E0);

  // Text styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textDark,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 16,
    color: textGrey,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    color: textLight,
  );

  static const TextStyle inputTextStyle = TextStyle(
    color: textDark,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Widget dimensions
  static const double buttonHeight = 54.0;
  static const double cardRadius = 12.0;
  static const double defaultPadding = 24.0;
  static const double formSpacing = 40.0;
  static const double smallSpacing = 8.0;

  // Create theme data
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: accentColor,
      ),
      scaffoldBackgroundColor: backgroundLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textLight,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: textLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius),
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cardRadius),
          borderSide: const BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cardRadius),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cardRadius),
          borderSide: const BorderSide(color: primaryColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}