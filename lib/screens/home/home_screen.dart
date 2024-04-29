import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/home/components/search_dialog.dart';
import 'package:xlo_mobx/screens/home/components/top_bar.dart';
import 'package:xlo_mobx/stores/filter.dart';
import 'package:xlo_mobx/stores/home.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    FilterStore().save();
    return SafeArea(
      child: Observer(
        builder: (context) {
          return Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: homeStore.search?.isEmpty ?? true
                  ? Container()
                  : GestureDetector(
                      onTap: () => openSearch(context),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox(
                            width: constraints.biggest.width,
                            child: Center(
                              child: Text(homeStore.search!),
                            ),
                          );
                        },
                      ),
                    ),
              centerTitle: true,
              actions: [
                homeStore.search?.isEmpty ?? true
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
            body: Column(
              children: [
                const TopBar(),
                Expanded(
                  child: homeStore.error.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error,
                                color: Colors.white,
                                size: 100,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Ocorreu um erro!\n${homeStore.error}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      : homeStore.loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : homeStore.adList.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.border_clear,
                                        color: Colors.white,
                                        size: 100,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Hum... Nenhum anúncio encontrado!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
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
            currentSearch: homeStore.search ?? '',
          ),
        ) ??
        '';
    homeStore.setSearch(search);
  }
}
