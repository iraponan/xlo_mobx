import 'package:brasil_fields/brasil_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/models/ad.dart';

class AdTile extends StatelessWidget {
  const AdTile({super.key, required this.ad});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Text(
                        '${UtilData.obterDataDDMMAAAA(ad.createdAt ?? DateTime.now())}\n'
                        '${ad.address?.city.name}/${ad.address?.federativeUnit.initials}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}