import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/repositories/favorite.dart';
import 'package:xlo_mobx/stores/user_manager.dart';

part 'favorite.g.dart';

class FavoriteStore = FavoriteStoreBase with _$FavoriteStore;

abstract class FavoriteStoreBase with Store {
  FavoriteStoreBase() {
    reaction(
      (_) => userManagerStore.isLoggedIn,
      (_) => _getFavoriteList(),
    );
  }

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  ObservableList<Ad> favoriteList = ObservableList<Ad>();

  @action
  Future<void> _getFavoriteList() async {
    //try {
    favoriteList.clear();
    final favorites =
        await FavoriteRepository().getFavorites(user: userManagerStore.user!);
    favoriteList.addAll(favorites);
    /*} catch (e) {
      error = e.toString();
      print('Erro: $error');
    }*/
  }

  @observable
  String error = '';

  @action
  Future<void> toggleFavorite(Ad ad) async {
    try {
      if (favoriteList.any((a) => a.id == ad.id)) {
        favoriteList.removeWhere((a) => a.id == ad.id);
        await FavoriteRepository().delete(ad: ad, user: userManagerStore.user!);
      } else {
        favoriteList.add(ad);
        await FavoriteRepository().save(ad: ad, user: userManagerStore.user!);
      }
    } catch (e) {
      error = e.toString();
    }
  }
}
