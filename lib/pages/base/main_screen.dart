import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/pages/home/home_screen.dart';
import 'package:xlo_mobx/stores/page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController pageController = PageController();
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();
    reaction(
          (_) => pageStore.page,
          (page) => pageController.jumpToPage(page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}
