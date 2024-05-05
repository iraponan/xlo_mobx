import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xlo_mobx/models/ad.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.ad});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19), color: Colors.orange),
            child: Row(
              children: [
                ad.hidePhone ?? false
                    ? Container()
                    : Expanded(
                        child: GestureDetector(
                          onTap: () {
                            final phone =
                                ad.user?.phone.replaceAll(RegExp('[^0-9]'), '');
                            final phoneUri = Uri(scheme: 'tel', path: phone);
                            launchUrl(phoneUri);
                          },
                          child: Container(
                            height: 25,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.white),
                              ),
                            ),
                            child: const Text(
                              'Ligar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 25,
                      alignment: Alignment.center,
                      child: const Text(
                        'Chat',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 249, 249, 1),
              border: Border(
                top: BorderSide(color: Colors.grey[400]!),
              ),
            ),
            height: 38,
            alignment: Alignment.center,
            child: Text(
              '${ad.user?.name ?? 'Nome Não Definido.'} (anunciante)',
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
