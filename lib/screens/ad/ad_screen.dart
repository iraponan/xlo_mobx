import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/error_box.dart';
import 'package:xlo_mobx/helpers/enums/ad_status.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/screens/ad/components/bottom_bar.dart';
import 'package:xlo_mobx/screens/ad/components/description_panel.dart';
import 'package:xlo_mobx/screens/ad/components/location_panel.dart';
import 'package:xlo_mobx/screens/ad/components/main_panel.dart';
import 'package:xlo_mobx/screens/ad/components/user_panel.dart';
import 'package:xlo_mobx/stores/favorite.dart';
import 'package:xlo_mobx/stores/user_manager.dart';

class AdScreen extends StatelessWidget {
  const AdScreen({super.key, required this.ad});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();
    final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Anúncio'),
            centerTitle: true,
            actions: [
              ad.status == AdStatus.active && userManagerStore.isLoggedIn
                  ? IconButton(
                      onPressed: () => favoriteStore.toggleFavorite(ad),
                      icon: Icon(
                          favoriteStore.favoriteList.any((a) => a.id == ad.id)
                              ? Icons.favorite
                              : Icons.favorite_border),
                    )
                  : Container(),
            ],
          ),
          body: Stack(
            children: [
              ListView(
                children: [
                  favoriteStore.error.isNotEmpty
                      ? ErrorBox(
                          message: favoriteStore.error,
                        )
                      : Container(),
                  SizedBox(
                    height: 280,
                    child: AnotherCarousel(
                      dotSize: 4,
                      dotColor: Colors.orange,
                      dotBgColor: Colors.transparent,
                      autoplay: false,
                      images: (ad.images ?? [])
                          .map((url) => CachedNetworkImageProvider(url))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MainPanel(ad: ad),
                        Divider(color: Colors.grey[500]),
                        DescriptionPanel(ad: ad),
                        Divider(color: Colors.grey[500]),
                        LocationPanel(ad: ad),
                        Divider(color: Colors.grey[500]),
                        UserPanel(ad: ad),
                        SizedBox(
                            height: ad.status == AdStatus.pending ? 16 : 96),
                      ],
                    ),
                  ),
                ],
              ),
              BottomBar(ad: ad),
            ],
          ),
        );
      },
    );
  }
}
