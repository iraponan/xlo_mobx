import 'package:brasil_fields/brasil_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:xlo_mobx/helpers/ad_menu_choice.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/screens/ad/ad_screen.dart';
import 'package:xlo_mobx/screens/create_ad/create_ad_screen.dart';
import 'package:xlo_mobx/stores/my_ads.dart';

class ActiveTile extends StatelessWidget {
  const ActiveTile({super.key, required this.ad, required this.myAdsStore});

  final Ad ad;
  final MyAdsStore myAdsStore;

  @override
  Widget build(BuildContext context) {
    final List<MenuChoice> choices = [
      MenuChoice(
        index: 0,
        title: 'Editar',
        iconData: Icons.edit,
      ),
      MenuChoice(
        index: 1,
        title: 'Já Vendi',
        iconData: Icons.thumb_up,
      ),
      MenuChoice(
        index: 2,
        title: 'Excluir',
        iconData: Icons.delete,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdScreen(ad: ad),
          ),
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: SizedBox(
            height: 80,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: ad.images != null && ad.images!.isEmpty
                        ? dotenv.env['IMAGE_EMPTY'] ?? ''
                        : ad.images?.first,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ad.title ?? 'Título não informado.',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          UtilBrasilFields.obterReal(
                              double.tryParse(ad.price.toString()) ?? 0,
                              moeda: true),
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '${ad.views ?? 0} visitas.',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PopupMenuButton<MenuChoice>(
                  onSelected: (choice) {
                    switch (choice.index) {
                      case 0:
                        editAd(context);
                        break;
                      case 1:
                        break;
                      case 2:
                        break;
                      default:
                        break;
                    }
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.purple,
                  ),
                  itemBuilder: (context) => choices
                      .map(
                        (choice) => PopupMenuItem<MenuChoice>(
                          value: choice,
                          child: Row(
                            children: [
                              Icon(
                                choice.iconData,
                                size: 20,
                                color: Colors.purple,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                choice.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editAd(BuildContext context) async {
    final success = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (c) => CreateAdScreen(ad: ad),
      ),
    );
    if (success != null && success) {
      myAdsStore.refresh();
    }
  }
}
