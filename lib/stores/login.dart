import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/repositories/user.dart';

part 'login.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  String? get emailError =>
      email == null || emailValid ? null : 'E-mail inválido!';

  @observable
  String? password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password!.length >= 4;

  String? get passwordError =>
      password == null || passwordValid ? null : 'Senha inválida!';

  @computed
  dynamic get loginPressed =>
      emailValid && passwordValid && !loading ? _login : null;

  @observable
  bool loading = false;

  @observable
  String error = '';

  @action
  Future<void> _login() async {
    FocusManager.instance.primaryFocus?.unfocus();

    loading = true;
    error = '';

    try {
      final user = await UserRepository().loginWithEmail(email!, password!);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}
