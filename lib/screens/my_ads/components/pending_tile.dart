import 'package:brasil_fields/brasil_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/screens/ad/ad_screen.dart';

class PendingTile extends StatelessWidget {
  const PendingTile({super.key, required this.ad});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdScreen(ad: ad),
          ),
        ),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
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
                    padding: const EdgeInsets.all(8),
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
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.orange,
                              size: 15,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'AGUARDANDO PUBLICAÇÃO',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
