import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/repositories/favorite.dart';
import 'package:xlo_mobx/stores/user_manager.dart';

part 'favorite.g.dart';

class FavoriteStore = FavoriteStoreBase with _$FavoriteStore;

abstract class FavoriteStoreBase with Store {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @observable
  String error = '';

  Future<void> toggleFavorite(Ad ad) async {
    try {
      await FavoriteRepository().save(ad: ad, user: userManagerStore.user!);
    } catch (e) {
      error = e.toString();
    }
  }
}
