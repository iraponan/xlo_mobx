import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/screens/account/account_screen.dart';
import 'package:xlo_mobx/screens/create_ad/create_ad_screen.dart';
import 'package:xlo_mobx/screens/favorite/favorite_screen.dart';
import 'package:xlo_mobx/screens/home/home_screen.dart';
import 'package:xlo_mobx/screens/offline/offline_screen.dart';
import 'package:xlo_mobx/stores/connectivity.dart';
import 'package:xlo_mobx/stores/page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController pageController = PageController();
  final PageStore pageStore = GetIt.I<PageStore>();
  final ConnectivityStore connectivityStore = GetIt.I<ConnectivityStore>();

  @override
  void initState() {
    super.initState();
    reaction(
      (_) => pageStore.page,
      (page) => pageController.jumpToPage(page),
    );

    autorun((_) {
      if (!connectivityStore.connected) {
        Future.delayed(const Duration(seconds: 1)).then((v) {
          showDialog(context: context, builder: (_) => const OfflineScreen());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          const CreateAdScreen(),
          Container(
            color: Colors.yellow,
          ),
          const FavoriteScreen(),
          const AccountScreen(),
        ],
      ),
    );
  }
}
