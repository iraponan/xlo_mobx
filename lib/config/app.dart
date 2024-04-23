import 'package:flutter/material.dart';
import 'package:xlo_mobx/config/theme.dart';
import 'package:xlo_mobx/screens/base/main_screen.dart';

class AppXLOMobx extends StatelessWidget {
  const AppXLOMobx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO Mobx',
      debugShowCheckedModeBanner: false,
      theme: ThemeProject.theme,
      home: const MainScreen(),
    );
  }
}