import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModel extends StatelessWidget {
  const ImageSourceModel({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o anúncio'),
        message: const Text('Qual a origem da foto?'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              Text(
                ' Cancelar',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: getFromCamera,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt),
                Text(' Câmera'),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: getFromGallery,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_search),
                Text(' Galeria'),
              ],
            ),
          ),
        ],
      );
    } else {
      return BottomSheet(
        onClosing: () {},
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: getFromCamera,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt),
                  Text(' Câmera'),
                ],
              ),
            ),
            TextButton(
              onPressed: getFromGallery,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_search),
                  Text(' Galeria'),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Future<void> getFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    imageSelected(File(pickedFile?.path ?? ''));
  }

  Future<void> getFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    imageSelected(File(pickedFile?.path ?? ''));
  }

  void imageSelected(File image) {
    print(image.path);
  }
}
