import'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFE65100); // ส้มเข้ม
  static const Color accentColor = Color(0xFFFF8A65); //ส้มอ่อน
  static const Color backgroundColor = Color(0xFFF5F5F5); //สีเทาอ่อน
  static const Color cardColor = Colors.white;
  static const Color textPrimary = Color(0xFF212121); //สีเทาเข้ม
  static const Color textSecondary = Color(0xFF757575); //สีเทา
  static const Color successColor = Color(0xFF4CAF50); //สีเขียว
  static const Color unsuccessColor = Colors.red;
  static const Color starColor = Colors.yellow;

  static ThemeData get theme => ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: accentColor,
    ),
    scaffoldBackgroundColor:  backgroundColor,
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        )
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryColor, width: 2)
      ),
      contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14)
    )
  );
}