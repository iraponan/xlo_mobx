import 'package:brasil_fields/brasil_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:xlo_mobx/models/ad.dart';

class ActiveTile extends StatelessWidget {
  const ActiveTile({super.key, required this.ad});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
            ],
          ),
        ),
      ),
    );
  }
}
