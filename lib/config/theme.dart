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
    cardTheme: const CardTheme(elevation: 8),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.orange,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.orange.withAlpha(120),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
      circularTrackColor: Colors.orange,
      linearTrackColor: Colors.orange,
    ),
  );
}
