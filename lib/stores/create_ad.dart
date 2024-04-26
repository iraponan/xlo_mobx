import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/category.dart';

part 'create_ad.g.dart';

class CreateAdStore = CreateAdStoreBase with _$CreateAdStore;

abstract class CreateAdStoreBase with Store {
  ObservableList images = ObservableList();

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;
}
