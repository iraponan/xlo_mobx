// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpStore on SignUpStoreBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'SignUpStoreBase.nameValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'SignUpStoreBase.emailValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: 'SignUpStoreBase.phoneValid'))
          .value;
  Computed<bool>? _$pass1ValidComputed;

  @override
  bool get pass1Valid =>
      (_$pass1ValidComputed ??= Computed<bool>(() => super.pass1Valid,
              name: 'SignUpStoreBase.pass1Valid'))
          .value;
  Computed<bool>? _$pass2ValidComputed;

  @override
  bool get pass2Valid =>
      (_$pass2ValidComputed ??= Computed<bool>(() => super.pass2Valid,
              name: 'SignUpStoreBase.pass2Valid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'SignUpStoreBase.isFormValid'))
          .value;
  Computed<dynamic>? _$signUpPressedComputed;

  @override
  dynamic get signUpPressed =>
      (_$signUpPressedComputed ??= Computed<dynamic>(() => super.signUpPressed,
              name: 'SignUpStoreBase.signUpPressed'))
          .value;

  late final _$nameAtom = Atom(name: 'SignUpStoreBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'SignUpStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: 'SignUpStoreBase.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$pass1Atom =
      Atom(name: 'SignUpStoreBase.pass1', context: context);

  @override
  String? get pass1 {
    _$pass1Atom.reportRead();
    return super.pass1;
  }

  @override
  set pass1(String? value) {
    _$pass1Atom.reportWrite(value, super.pass1, () {
      super.pass1 = value;
    });
  }

  late final _$pass2Atom =
      Atom(name: 'SignUpStoreBase.pass2', context: context);

  @override
  String? get pass2 {
    _$pass2Atom.reportRead();
    return super.pass2;
  }

  @override
  set pass2(String? value) {
    _$pass2Atom.reportWrite(value, super.pass2, () {
      super.pass2 = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'SignUpStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_signUpAsyncAction =
      AsyncAction('SignUpStoreBase._signUp', context: context);

  @override
  Future<void> _signUp() {
    return _$_signUpAsyncAction.run(() => super._signUp());
  }

  late final _$SignUpStoreBaseActionController =
      ActionController(name: 'SignUpStoreBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$SignUpStoreBaseActionController.startAction(
        name: 'SignUpStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$SignUpStoreBaseActionController.startAction(
        name: 'SignUpStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$SignUpStoreBaseActionController.startAction(
        name: 'SignUpStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass1(String? value) {
    final _$actionInfo = _$SignUpStoreBaseActionController.startAction(
        name: 'SignUpStoreBase.setPass1');
    try {
      return super.setPass1(value);
    } finally {
      _$SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass2(String? value) {
    final _$actionInfo = _$SignUpStoreBaseActionController.startAction(
        name: 'SignUpStoreBase.setPass2');
    try {
      return super.setPass2(value);
    } finally {
      _$SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
phone: ${phone},
pass1: ${pass1},
pass2: ${pass2},
loading: ${loading},
nameValid: ${nameValid},
emailValid: ${emailValid},
phoneValid: ${phoneValid},
pass1Valid: ${pass1Valid},
pass2Valid: ${pass2Valid},
isFormValid: ${isFormValid},
signUpPressed: ${signUpPressed}
    ''';
  }
}
