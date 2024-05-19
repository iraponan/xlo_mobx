import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:xlo_mobx/helpers/consts/vendor.dart';
import 'package:xlo_mobx/helpers/enums/ad_status.dart';
import 'package:xlo_mobx/helpers/enums/order_by.dart';
import 'package:xlo_mobx/helpers/enums/user_type.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/erros/parse_erros.dart';
import 'package:xlo_mobx/repositories/keys/ad.dart';
import 'package:xlo_mobx/repositories/keys/category.dart';
import 'package:xlo_mobx/repositories/keys/user.dart';
import 'package:xlo_mobx/repositories/user.dart';
import 'package:xlo_mobx/stores/filter.dart';

class AdRepository {
  Future<List<Ad>> getHomeAdList({
    FilterStore? filter,
    String? search,
    Category? category,
    int? page,
  }) async {
    await UserRepository().currentUser();
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable))
      ..includeObject([keyAdOwner, keyAdCategory])
      ..setAmountToSkip((page ?? 0) * 10)
      ..setLimit(10)
      ..whereEqualTo(keyAdStatus, AdStatus.active.index);

    if (search != null && search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyAdTitle, search, caseSensitive: false);
    }
    if (category != null && category.id != '*') {
      queryBuilder.whereEqualTo(
          keyAdCategory,
          (ParseObject(keyCategoryTable)..set(keyCategoryId, category.id))
              .toPointer());
    }
    switch (filter?.orderBy) {
      case OrderBy.price:
        queryBuilder.orderByAscending(keyAdPrice);
        break;
      case OrderBy.date:
      case null:
      default:
        queryBuilder.orderByDescending(keyAdCreatedAt);
        break;
    }

    if (filter?.minPrice != null && (filter!.minPrice ?? 0) > 0) {
      queryBuilder.whereGreaterThanOrEqualsTo(keyAdPrice, filter.minPrice);
    }
    if (filter?.maxPrice != null && (filter!.maxPrice ?? 0) > 0) {
      queryBuilder.whereLessThanOrEqualTo(keyAdPrice, filter.maxPrice);
    }

    if (filter?.vendoType != null &&
        filter!.vendoType > 0 &&
        filter.vendoType < (vendorTypeProfessional | vendorTypeParticular)) {
      final userQuery = QueryBuilder<ParseUser>(ParseUser.forQuery());

      if (filter.vendoType == vendorTypeParticular) {
        userQuery.whereEqualTo(keyUserType, UserType.particular.index);
      }

      if (filter.vendoType == vendorTypeProfessional) {
        userQuery.whereEqualTo(keyUserType, UserType.professional.index);
      }

      queryBuilder.whereMatchesQuery(keyAdOwner, userQuery);
    }

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.map((r) => Ad.fromParse(r)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(
          ParseErrors.getDescription(response.error?.code ?? -1));
    }
  }

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
        ..set(
          keyAdStreet,
          ad.address?.street ?? '',
        )
        ..set<String>(
          keyAdDistrict,
          ad.address?.district ?? '',
        )
        ..set<String>(
          keyAdCity,
          ad.address?.city.name ?? '',
        )
        ..set<String>(
          keyAdFederativeUnit,
          ad.address?.federativeUnit.initials ?? '',
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
          ad.hidePhone ?? false,
        )
        ..set<int>(
          keyAdStatus,
          ad.status?.index ?? 1,
        )
        ..set<ParseUser>(
          keyAdOwner,
          parseUser,
        );

      if (ad.id != null) {
        adObject.objectId = ad.id;
      }

      final response = await adObject.save();

      if (!response.success) {
        Future.error(ParseErrors.getDescription(response.error?.code ?? -1));
      }
    } catch (e) {
      Future.error('Falha ao salvar o anúncio. ${e.toString()}');
    }
  }

  Future<List<ParseFile>> saveImages(List<dynamic>? images) async {
    final parseImages = <ParseFile>[];

    try {
      if (images != null) {
        for (final image in images) {
          if (image is String) {
            final parseFile = ParseFile(
              File(path.basename(image)),
              name: path.basename(image),
              url: image,
            );
            parseImages.add(parseFile);
          } else if (image is File) {
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
      return Future.error('Falha ao salvar imagens. ${e.toString()}');
    }
  }

  Future<List<Ad>> getMyAds({User? user}) async {
    final currentUser = ParseUser('', '', '')..set(keyUserId, user?.id);
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable))
      ..setLimit(100)
      ..orderByDescending(keyAdCreatedAt)
      ..whereEqualTo(keyAdOwner, currentUser.toPointer())
      ..includeObject([keyAdCategory, keyAdOwner]);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.map((r) => Ad.fromParse(r)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(
          ParseErrors.getDescription(response.error?.code ?? -1));
    }
  }

  Future<void> sold(Ad ad) async {
    final parseObject = ParseObject(keyAdTable)
      ..set(keyAdId, ad.id)
      ..set(keyAdStatus, AdStatus.sold.index);

    final response = await parseObject.save();

    if (!response.success) {
      return Future.error(
          ParseErrors.getDescription(response.error?.code ?? -1));
    }
  }

  Future<void> delete(Ad ad) async {
    final parseObject = ParseObject(keyAdTable)
      ..set(keyAdId, ad.id)
      ..set(keyAdStatus, AdStatus.deleted.index);

    final response = await parseObject.save();

    if (!response.success) {
      return Future.error(
          ParseErrors.getDescription(response.error?.code ?? -1));
    }
  }
}
