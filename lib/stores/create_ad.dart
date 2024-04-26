import 'package:mobx/mobx.dart';

part 'create_ad.g.dart';

class CreateAdStore = CreateAdStoreBase with _$CreateAdStore;

abstract class CreateAdStoreBase with Store {
  ObservableList images = ObservableList();
}
