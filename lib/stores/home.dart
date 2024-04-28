import 'package:mobx/mobx.dart';

part 'home.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;
}
