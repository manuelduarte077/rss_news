import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final appTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,

    /// Font Family
    fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
