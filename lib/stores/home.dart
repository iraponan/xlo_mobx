import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/repositories/ad.dart';
import 'package:xlo_mobx/stores/filter.dart';

part 'home.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase() {
    autorun(
      (_) async {
        try {
          setLoading(true);
          final newAds = await AdRepository().getHomeAdList(
            filter: filterStore,
            search: search,
            category: category,
          );
          adList.clear();
          adList.addAll(newAds);
          setError('');
          setLoading(false);
        } catch (e) {
          setError(e.toString());
          setLoading(false);
        }
      },
    );
  }

  ObservableList<Ad> adList = ObservableList<Ad>();

  @observable
  String? search;

  @action
  void setSearch(String value) => search = value;

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  FilterStore filterStore = FilterStore();

  FilterStore get cloneFilter => filterStore.clone();

  @action
  void setFilter(FilterStore value) => filterStore = value;

  @observable
  String error = '';

  @action
  void setError(String value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @override
  String toString() {
    return 'HomeStoreBase{adList: $adList, search: $search, category: $category, filterStore: $filterStore, error: $error, loading: $loading}';
  }
}
