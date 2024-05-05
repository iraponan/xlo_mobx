import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/repositories/ad.dart';
import 'package:xlo_mobx/stores/user_manager.dart';

part 'my_ads.g.dart';

class MyAdsStore = MyAdsStoreBase with _$MyAdsStore;

abstract class MyAdsStoreBase with Store {
  MyAdsStoreBase() {
    _getMyAds();
  }

  Future<void> _getMyAds() async {
    final user = GetIt.I<UserManagerStore>().user;
    final ads = await AdRepository().getMyAds(user: user);
  }
}
