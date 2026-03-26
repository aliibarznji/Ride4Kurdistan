import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_palette.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData build() {
    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppPalette.forest,
        brightness: Brightness.dark,
        primary: AppPalette.forest,
        secondary: AppPalette.moss,
        surface: AppPalette.surface,
      ),
      scaffoldBackgroundColor: AppPalette.background,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.manropeTextTheme(baseTheme.textTheme).copyWith(
        displayLarge: GoogleFonts.dmSerifDisplay(
          fontSize: 56,
          color: AppPalette.ink,
        ),
        displayMedium: GoogleFonts.dmSerifDisplay(
          fontSize: 40,
          color: AppPalette.ink,
        ),
        headlineLarge: GoogleFonts.dmSerifDisplay(
          fontSize: 34,
          color: AppPalette.ink,
        ),
        headlineMedium: GoogleFonts.dmSerifDisplay(
          fontSize: 28,
          color: AppPalette.ink,
        ),
        titleMedium: GoogleFonts.manrope(
          color: AppPalette.ink,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: GoogleFonts.manrope(color: AppPalette.ink),
        bodyMedium: GoogleFonts.manrope(color: AppPalette.ink),
        bodySmall: GoogleFonts.manrope(color: AppPalette.muted),
        labelLarge: GoogleFonts.manrope(
          color: AppPalette.ink,
          fontWeight: FontWeight.w700,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppPalette.cardSoft,
        hintStyle: const TextStyle(color: AppPalette.muted),
        prefixIconColor: AppPalette.muted,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppPalette.line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppPalette.forest, width: 1.5),
        ),
      ),
    );
  }
}
