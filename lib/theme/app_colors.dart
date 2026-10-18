import 'package:flutter/material.dart';

/// Central color palette for the portfolio.
///
/// A single calm blue accent on neutral slate surfaces keeps the page
/// professional and easy to scan.
class AppColors {
  AppColors._();

  static const Color accent = Color(0xFF2563EB);
  static const Color accentLight = Color(0xFF60A5FA);

  // Dark theme surfaces.
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkSurfaceAlt = Color(0xFF162033);
  static const Color darkBorder = Color(0xFF334155);
  static const Color darkTextPrimary = Color(0xFFF1F5F9);
  static const Color darkTextMuted = Color(0xFF94A3B8);

  // Light theme surfaces.
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceAlt = Color(0xFFF8FAFC);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextMuted = Color(0xFF475569);
}
