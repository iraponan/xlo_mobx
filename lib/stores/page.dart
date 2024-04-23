import 'package:mobx/mobx.dart';

part 'page.g.dart';

class PageStore = PageStoreBase with _$PageStore;

abstract class PageStoreBase with Store {
  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;
}