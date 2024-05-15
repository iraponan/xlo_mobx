import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/enums/user_type.dart';

part 'edit_account.g.dart';

class EditAccountStore = EditAccountStoreBase with _$EditAccountStore;

abstract class EditAccountStoreBase with Store {
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
}
