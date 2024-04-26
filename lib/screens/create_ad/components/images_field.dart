import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/create_ad/components/image_source_modal.dart';
import 'package:xlo_mobx/stores/create_ad.dart';

class ImagesField extends StatelessWidget {
  const ImagesField({super.key, required this.createAdStore});

  final CreateAdStore createAdStore;

  @override
  Widget build(BuildContext context) {
    int maxImages = 4;

    void onImageSelected(File image) {
      Navigator.of(context).pop();
      createAdStore.images.add(image);
    }

    return Container(
      color: Colors.grey[200],
      height: 120,
      child: Observer(
        builder: (context) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: createAdStore.images.length < maxImages
                ? createAdStore.images.length + 1
                : maxImages,
            itemBuilder: (BuildContext context, int index) {
              if (index == createAdStore.images.length) {
                print(
                    'Index: $index\ncreateAdStore: ${createAdStore.images.length}');
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: GestureDetector(
                    onTap: () {
                      if (Platform.isIOS) {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => ImageSourceModel(
                            onImageSelected: onImageSelected,
                          ),
                        );
                      } else {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => ImageSourceModel(
                            onImageSelected: onImageSelected,
                          ),
                        );
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
              } else {
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    8,
                    16,
                    index == (maxImages - 1) ? 8 : 0,
                    16,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 44,
                      backgroundImage: FileImage(createAdStore.images[index]),
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
