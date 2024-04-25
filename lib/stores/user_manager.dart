import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/user.dart';

part 'user_manager.g.dart';

class UserManagerStore = UserManagerStoreBase with _$UserManagerStore;

abstract class UserManagerStoreBase with Store {
  @observable
  User? user;

  @action
  void setUser (User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;
}