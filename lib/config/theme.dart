import 'package:flutter/material.dart';

mixin ThemeProject {
  static final theme = ThemeData(
    primarySwatch: Colors.purple,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.purple,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.orange,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
