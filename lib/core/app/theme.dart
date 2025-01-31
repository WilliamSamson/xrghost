import 'package:flutter/material.dart';
import 'package:xrghost/core/imports.dart';

// Light Theme
final ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: const Color(0xFF2A2D3E),
  scaffoldBackgroundColor: const Color(0xFFF8F9FA),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: const Color(0xFF2A2D3E),
    displayColor: const Color(0xFF2A2D3E),
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppColors(
      gradientStart: const Color(0xFF6B34CC),
      gradientEnd: const Color(0xFF4A90E2),
      statCardBg: Colors.white,
    ),
  ],
);

// Dark Theme
final ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: const Color(0xFF1A1C28),
  scaffoldBackgroundColor: const Color(0xFF121212),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppColors(
      gradientStart: const Color(0xFF884DFF),
      gradientEnd: const Color(0xFF4D7CFF),
      statCardBg: const Color(0xFF2A2D3E),
    ),
  ],
);

// Custom Theme Extensions
class AppColors extends ThemeExtension<AppColors> {
  final Color gradientStart;
  final Color gradientEnd;
  final Color statCardBg;

  const AppColors({
    required this.gradientStart,
    required this.gradientEnd,
    required this.statCardBg,
  });

  @override
  ThemeExtension<AppColors> copyWith() => this;

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) => this;
}

// Quick Access Extension
extension ThemeExtensions on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}