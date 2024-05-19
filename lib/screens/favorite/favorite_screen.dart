import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/drawer/custom_drawer.dart';
import 'package:xlo_mobx/components/empty_card.dart';
import 'package:xlo_mobx/screens/favorite/components/favorite_tile.dart';
import 'package:xlo_mobx/stores/favorite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, this.hideDrawer = false});

  final bool hideDrawer;

  @override
  Widget build(BuildContext context) {
    final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Favoritos'),
            centerTitle: true,
          ),
          drawer: hideDrawer ? null : const CustomDrawer(),
          body: favoriteStore.favoriteList.isEmpty
              ? const EmptyCard(
                  text: 'Nenhum anúncio favoritado.',
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(2),
                  itemCount: favoriteStore.favoriteList.length,
                  itemBuilder: (context, index) => FavoriteTile(
                    ad: favoriteStore.favoriteList[index],
                  ),
                ),
        );
      },
    );
  }
}
