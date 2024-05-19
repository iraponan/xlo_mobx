import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/repositories/ad.dart';
import 'package:xlo_mobx/stores/connectivity.dart';
import 'package:xlo_mobx/stores/filter.dart';

part 'home.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase() {
    autorun(
      (_) async {
        if (connectivityStore.connected) {
          try {
            setLoading(true);
            final newAds = await AdRepository().getHomeAdList(
              filter: filterStore,
              search: search,
              category: category,
              page: page,
            );
            addNewAds(newAds);
            setError('');
            setLoading(false);
          } catch (e) {
            setError(e.toString());
            setLoading(false);
          }
        }
      },
    );
  }

  final ConnectivityStore connectivityStore = GetIt.I<ConnectivityStore>();

  ObservableList<Ad> adList = ObservableList<Ad>();

  @observable
  String search = '';

  @action
  void setSearch(String value) {
    search = value;
    resetPage();
  }

  @observable
  Category? category;

  @action
  void setCategory(Category value) {
    category = value;
    resetPage();
  }

  @observable
  FilterStore filterStore = FilterStore();

  FilterStore get cloneFilter => filterStore.clone();

  @action
  void setFilter(FilterStore value) {
    filterStore = value;
    resetPage();
  }

  @observable
  String error = '';

  @action
  void setError(String value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  int page = 0;

  @observable
  bool lastPage = false;

  @action
  void loadNextPage() => page++;

  @action
  void addNewAds(List<Ad> newAds) {
    if (newAds.length < 10) {
      lastPage = true;
    }
    adList.addAll(newAds);
  }

  @computed
  int get itemCount => lastPage ? adList.length : adList.length + 1;

  void resetPage() {
    page = 0;
    adList.clear();
    lastPage = false;
  }

  @computed
  bool get showProgress => loading && adList.isEmpty;

  @override
  String toString() {
    return 'HomeStoreBase{adList: $adList, search: $search, category: $category, filterStore: $filterStore, error: $error, loading: $loading}';
  }
}
