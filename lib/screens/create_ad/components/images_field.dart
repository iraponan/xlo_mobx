import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/create_ad/components/image_source_modal.dart';

class ImagesField extends StatelessWidget {
  const ImagesField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: GestureDetector(
              onTap: () {
                if (Platform.isIOS) {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => const ImageSourceModel());
                } else {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => const ImageSourceModel());
                }
              },
              child: CircleAvatar(
                radius: 44,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
