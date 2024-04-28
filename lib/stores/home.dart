import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/category.dart';

part 'home.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;
}