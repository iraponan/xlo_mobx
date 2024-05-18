import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/enums/user_type.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/user.dart';
import 'package:xlo_mobx/stores/user_manager.dart';

part 'edit_account.g.dart';

class EditAccountStore = EditAccountStoreBase with _$EditAccountStore;

abstract class EditAccountStoreBase with Store {
  EditAccountStoreBase() {
    user = userManagerStore.user;

    userType = user?.type;
    name = user?.name;
    phone = user?.phone;
  }

  late User? user;

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @observable
  UserType? userType;

  @action
  void setUserType(int? value) => userType = UserType.values[value ?? 0];

  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name!.length >= 6;
  String? get nameError =>
      nameValid || name == null ? null : 'Campo obrigatório';

  @observable
  String? phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone!.length >= 14;
  String? get phoneError =>
      phoneValid || phone == null ? null : 'Campo obrigatório';

  @observable
  String pass1 = '';

  @action
  void setPass1(String value) => pass1 = value;

  @observable
  String pass2 = '';

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get passValid => pass1 == pass2 && (pass1.isEmpty || pass1.length >= 6);
  String? get passError => (pass1.isNotEmpty && pass1.length < 6)
      ? 'Senha muito curta.'
      : (pass1 != pass2)
          ? 'Senhas não coincidem'
          : null;

  @computed
  bool get isFormeValid => nameValid && phoneValid && passValid;

  @observable
  bool loading = false;

  @computed
  VoidCallback? get savePressed => isFormeValid && !loading ? _save : null;

  @observable
  String error = '';

  @action
  Future<void> _save() async {
    loading = true;

    if (user != null) {
      user!.name = name!;
      user!.phone = phone!;
      user!.type = userType!;

      if (pass1.isNotEmpty) {
        user!.password = pass1;
      } else {
        user!.password = null;
      }
      try {
        await UserRepository().save(user: user);
        userManagerStore.setUser(user);
      } catch (e) {
        error = e.toString();
      }
    }

    loading = false;
  }
}
