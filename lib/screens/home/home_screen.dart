import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/drawer/custom_drawer.dart';
import 'package:xlo_mobx/components/empty_card.dart';
import 'package:xlo_mobx/screens/home/components/ad_tile.dart';
import 'package:xlo_mobx/screens/home/components/create_ad_button.dart';
import 'package:xlo_mobx/screens/home/components/search_dialog.dart';
import 'package:xlo_mobx/screens/home/components/top_bar.dart';
import 'package:xlo_mobx/stores/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeStore homeStore = GetIt.I<HomeStore>();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return SafeArea(
          child: Scaffold(
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
            body: Column(
              children: [
                const TopBar(),
                Expanded(
                  child: Stack(
                    children: [
                      homeStore.error.isNotEmpty
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
                          : homeStore.showProgress
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : homeStore.adList.isEmpty
                                  ? const EmptyCard(
                                      text: 'Nenhum anúncio encontrado.',
                                    )
                                  : ListView.builder(
                                      controller: scrollController,
                                      itemBuilder: (context, index) {
                                        if (index < homeStore.adList.length) {
                                          return AdTile(
                                            ad: homeStore.adList[index],
                                          );
                                        } else {
                                          homeStore.loadNextPage();
                                          return const SizedBox(
                                            height: 10,
                                            child: LinearProgressIndicator(),
                                          );
                                        }
                                      },
                                      itemCount: homeStore.itemCount,
                                    ),
                      Positioned(
                        bottom: -50,
                        left: 0,
                        right: 0,
                        child: CreateAdButton(
                          scrollController: scrollController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
