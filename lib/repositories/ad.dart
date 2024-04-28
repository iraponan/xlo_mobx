import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/repositories/erros/parse_erros.dart';
import 'package:xlo_mobx/repositories/keys/ad.dart';
import 'package:xlo_mobx/repositories/keys/category.dart';

class AdRepository {
  Future<void> save(Ad ad) async {
    try {
      final parseImages = await saveImages(ad.images);

      final parseUser = await ParseUser.currentUser() as ParseUser;

      final parseAcl = ParseACL(owner: parseUser)
        ..setPublicReadAccess(allowed: true)
        ..setPublicWriteAccess(allowed: false);

      final adObject = ParseObject(keyAdTable)
        ..setACL(parseAcl)
        ..set<List<ParseFile>>(
          keyAdImages,
          parseImages,
        )
        ..set<String>(
          keyAdTitle,
          ad.title ?? '',
        )
        ..set<String>(
          keyAdDescription,
          ad.description ?? '',
        )
        ..set<ParseObject>(
          keyAdCategory,
          ParseObject(keyCategoryTable)
            ..set(
              keyCategoryId,
              ad.category?.id,
            ),
        )
        ..set<String>(
          keyAdDistrict,
          ad.address!.district,
        )
        ..set<String>(
          keyAdCity,
          ad.address!.city.name ?? '',
        )
        ..set<String>(
          keyAdFederativeUnit,
          ad.address!.federativeUnit.initials ?? '',
        )
        ..set<String>(
          keyAdPostalCode,
          ad.address?.postalCode ?? '',
        )
        ..set<num>(
          keyAdPrice,
          ad.price ?? 0,
        )
        ..set<bool>(
          keyAdHidePhone,
          ad.hidePhone,
        )
        ..set<int>(
          keyAdHidePhone,
          ad.status.index,
        )
        ..set<ParseUser>(
          keyAdOwner,
          parseUser,
        );

      final response = await adObject.save();

      if (response.success) {
        return response.result;
      } else {
        Future.error(ParseErrors.getDescription(response.error?.code ?? -1));
      }
    } catch (e) {
      Future.error('Falha ao salvar o anúncio.');
    }
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
                  ParseErrors.getDescription(response.error?.code ?? -1));
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
            'Não foi possível encontrar os arquivos das imagens.');
      }
    } catch (e) {
      return Future.error('Falha ao salvar imagens.');
    }
  }
}
