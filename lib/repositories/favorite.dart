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
}
