import 'package:flutter/material.dart';

class AppTextStyles {
  static final textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[800]),
    labelLarge: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue),
  );
}
