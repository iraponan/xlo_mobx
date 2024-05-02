import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/create_ad/components/image_dialog.dart';
import 'package:xlo_mobx/screens/create_ad/components/image_source_modal.dart';
import 'package:xlo_mobx/stores/create_ad.dart';

class ImagesField extends StatelessWidget {
  const ImagesField({super.key, required this.createAdStore});

  final CreateAdStore createAdStore;

  @override
  Widget build(BuildContext context) {
    int maxImages = 10;

    void onImageSelected(File image) {
      Navigator.of(context).pop();
      createAdStore.images.add(image);
    }

    return Observer(
      builder: (context) {
        return Column(
          children: [
            Container(
              color: Colors.grey[200],
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: createAdStore.images.length < maxImages
                    ? createAdStore.images.length + 1
                    : maxImages,
                itemBuilder: (BuildContext context, int index) {
                  if (index == createAdStore.images.length) {
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
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => ImageDialog(
                                image: createAdStore.images[index],
                                onDelete: () =>
                                    createAdStore.images.removeAt(index)),
                          );
                        },
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage:
                              FileImage(createAdStore.images[index]),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            createAdStore.imagesError.isEmpty
                ? Container()
                : Container(
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xffb3261e),
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                    child: Text(
                      createAdStore.imagesError,
                      style: const TextStyle(
                          color: Color(0xffb3261e), fontSize: 12),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
