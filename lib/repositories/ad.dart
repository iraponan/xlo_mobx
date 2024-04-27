import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/repositories/erros/parse_erros.dart';

class AdRepository {
  Future<void> save(Ad ad) async {
    final parseImages = await saveImages(ad.images);
  }

  Future<List<ParseFile>> saveImages(List<dynamic>? images) async {
    final parseImages = <ParseFile>[];

    try {
      if (images != null) {
        for (final image in images) {
          if (image is File) {
            final parseFile = ParseFile(
              image,
              name: path.basename(image.path),
            );
            final response = await parseFile.save();
            if (response.success) {
              parseImages.add(parseFile);
            } else {
              return Future.error(
                  ParseErrors.getDescription(response.error!.code));
            }
          } else {
            final parseFile = ParseFile(null);
            parseFile.name = path.basename(image);
            parseFile.url = image;
            parseImages.add(parseFile);
          }
        }
        return parseImages;
      } else {
        return Future.error('Falha ao salvar imagens.\n'
            'Não foi possivel encontrar os arquivos das imagens.');
      }
    } catch (e) {
      return Future.error('Falha ao salvar imagens.');
    }
  }
}
