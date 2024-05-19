import 'package:brasil_fields/brasil_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/screens/ad/ad_screen.dart';
import 'package:xlo_mobx/stores/favorite.dart';

class FavoriteTile extends StatelessWidget {
  const FavoriteTile({super.key, required this.ad});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AdScreen(ad: ad),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        height: 135,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              SizedBox(
                height: 135,
                width: 127,
                child: CachedNetworkImage(
                  imageUrl: ad.images?.first,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ad.title ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        UtilBrasilFields.obterReal(
                            double.tryParse(ad.price.toString()) ?? 0.0,
                            moeda: true),
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                                '${UtilData.obterDataDDMMAAAA(ad.createdAt ?? DateTime.now())} '
                                '${UtilData.obterHoraHHMM(ad.createdAt ?? DateTime.now())}\n'
                                '${ad.address?.city.name}/${ad.address?.federativeUnit.initials}'),
                          ),
                          GestureDetector(
                            onTap: () => favoriteStore.toggleFavorite(ad),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
