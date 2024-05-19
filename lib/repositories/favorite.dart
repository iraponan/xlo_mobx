import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/erros/parse_erros.dart';
import 'package:xlo_mobx/repositories/keys/ad.dart';
import 'package:xlo_mobx/repositories/keys/favorite.dart';

class FavoriteRepository {
  Future<void> save({required Ad ad, required User user}) async {
    final favoriteObject = ParseObject(keyFavoritesTable)
      ..set<String>(
        keyFavoritesOwner,
        user.id!,
      )
      ..set<ParseObject>(
        keyFavoritesAd,
        ParseObject(keyAdTable)..set(keyAdId, ad.id),
      );

    final response = await favoriteObject.save();

    if (!response.success) {
      return Future.error(
        ParseErrors.getDescription(response.error?.code ?? -1),
      );
    }
  }

  Future<void> delete({required Ad ad, required User user}) async {
    try {
      final queryBuilder =
          QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable))
            ..whereEqualTo(
              keyFavoritesOwner,
              user.id,
            )
            ..whereEqualTo(
              keyFavoritesAd,
              ParseObject(keyAdTable)
                ..set(
                  keyAdId,
                  ad.id,
                ),
            );

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        for (final f in response.results as List<ParseObject>) {
          await f.delete();
        }
      }

      if (!response.success) {
        return Future.error(
          ParseErrors.getDescription(response.error?.code ?? -1),
        );
      }
    } catch (e) {
      Future.error('Falha ao deletar favorito!');
    }
  }
}
