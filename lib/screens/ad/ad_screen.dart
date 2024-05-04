import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/screens/ad/components/description_panel.dart';
import 'package:xlo_mobx/screens/ad/components/location_panel.dart';
import 'package:xlo_mobx/screens/ad/components/main_panel.dart';
import 'package:xlo_mobx/screens/ad/components/user_panel.dart';

class AdScreen extends StatelessWidget {
  const AdScreen({super.key, required this.ad});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Anúncio'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
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
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
