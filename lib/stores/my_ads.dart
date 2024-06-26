import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/enums/ad_status.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/repositories/ad.dart';
import 'package:xlo_mobx/stores/user_manager.dart';

part 'my_ads.g.dart';

class MyAdsStore = MyAdsStoreBase with _$MyAdsStore;

abstract class MyAdsStoreBase with Store {
  MyAdsStoreBase() {
    _getMyAds();
  }

  @observable
  List<Ad> allads = [];

  @computed
  List<Ad> get activeAds =>
      allads.where((ad) => ad.status == AdStatus.active).toList();
  List<Ad> get pendingAds =>
      allads.where((ad) => ad.status == AdStatus.pending).toList();
  List<Ad> get soldAds =>
      allads.where((ad) => ad.status == AdStatus.sold).toList();

  Future<void> _getMyAds() async {
    final user = GetIt.I<UserManagerStore>().user;
    try {
      loading = true;
      allads = await AdRepository().getMyAds(user: user);
      loading = false;
    } catch (e) {
      loading = false;
      Future.error('Falha ao buscar os Anúncios!');
    }
  }

  @action
  Future<void> soldAd(Ad ad) async {
    loading = true;
    await AdRepository().sold(ad);
    refresh();
  }

  @action
  Future<void> deleteAd(Ad ad) async {
    loading = true;
    await AdRepository().delete(ad);
    refresh();
  }

  @observable
  bool loading = false;

  void refresh() => _getMyAds();
}
