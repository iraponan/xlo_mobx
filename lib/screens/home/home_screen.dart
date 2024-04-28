import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/home/components/search_dialog.dart';
import 'package:xlo_mobx/stores/home.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (context) {
          return Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: homeStore.search.isEmpty
                  ? Container()
                  : GestureDetector(
                      onTap: () => openSearch(context),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox(
                            width: constraints.biggest.width,
                            child: Center(
                              child: Text(homeStore.search),
                            ),
                          );
                        },
                      ),
                    ),
              centerTitle: true,
              actions: [
                homeStore.search.isEmpty
                    ? IconButton(
                        onPressed: () => openSearch(context),
                        icon: const Icon(Icons.search),
                      )
                    : IconButton(
                        onPressed: () => homeStore.setSearch(''),
                        icon: const Icon(Icons.close),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  void openSearch(BuildContext context) async {
    final String search = await showDialog(
          context: context,
          builder: (context) => SearchDialog(
            currentSearch: homeStore.search,
          ),
        ) ??
        '';
    homeStore.setSearch(search);
  }
}
