import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/models/ad.dart';

class MainPanel extends StatelessWidget {
  const MainPanel({super.key, required this.ad});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 14),
          child: Text(
            UtilBrasilFields.obterReal(
              double.tryParse(ad.price.toString()) ?? 0.0,
              moeda: true,
            ),
            style: TextStyle(
              fontSize: 34,
              letterSpacing: 2.8,
              fontWeight: FontWeight.w300,
              color: Colors.grey[800],
            ),
          ),
        ),
        Text(
          ad.title ?? '',
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 18),
          child: Text(
            'Publicado em ${UtilData.obterDataDDMMAAAA(ad.createdAt ?? DateTime.now())}'
            ' as ${UtilData.obterHoraHHMM(ad.createdAt ?? DateTime.now())}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}
