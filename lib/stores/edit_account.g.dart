// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_account.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditAccountStore on EditAccountStoreBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'EditAccountStoreBase.nameValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: 'EditAccountStoreBase.phoneValid'))
          .value;
  Computed<bool>? _$passValidComputed;

  @override
  bool get passValid =>
      (_$passValidComputed ??= Computed<bool>(() => super.passValid,
              name: 'EditAccountStoreBase.passValid'))
          .value;
  Computed<bool>? _$isFormeValidComputed;

  @override
  bool get isFormeValid =>
      (_$isFormeValidComputed ??= Computed<bool>(() => super.isFormeValid,
              name: 'EditAccountStoreBase.isFormeValid'))
          .value;
  Computed<VoidCallback?>? _$savePressedComputed;

  @override
  VoidCallback? get savePressed => (_$savePressedComputed ??=
          Computed<VoidCallback?>(() => super.savePressed,
              name: 'EditAccountStoreBase.savePressed'))
      .value;

  late final _$userTypeAtom =
      Atom(name: 'EditAccountStoreBase.userType', context: context);

  @override
  UserType? get userType {
    _$userTypeAtom.reportRead();
    return super.userType;
  }

  @override
  set userType(UserType? value) {
    _$userTypeAtom.reportWrite(value, super.userType, () {
      super.userType = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'EditAccountStoreBase.name', context: context);

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

  late final _$phoneAtom =
      Atom(name: 'EditAccountStoreBase.phone', context: context);

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
      Atom(name: 'EditAccountStoreBase.pass1', context: context);

  @override
  String get pass1 {
    _$pass1Atom.reportRead();
    return super.pass1;
  }

  @override
  set pass1(String value) {
    _$pass1Atom.reportWrite(value, super.pass1, () {
      super.pass1 = value;
    });
  }

  late final _$pass2Atom =
      Atom(name: 'EditAccountStoreBase.pass2', context: context);

  @override
  String get pass2 {
    _$pass2Atom.reportRead();
    return super.pass2;
  }

  @override
  set pass2(String value) {
    _$pass2Atom.reportWrite(value, super.pass2, () {
      super.pass2 = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'EditAccountStoreBase.loading', context: context);

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

  late final _$_saveAsyncAction =
      AsyncAction('EditAccountStoreBase._save', context: context);

  @override
  Future<void> _save() {
    return _$_saveAsyncAction.run(() => super._save());
  }

  late final _$EditAccountStoreBaseActionController =
      ActionController(name: 'EditAccountStoreBase', context: context);

  @override
  void setUserType(int? value) {
    final _$actionInfo = _$EditAccountStoreBaseActionController.startAction(
        name: 'EditAccountStoreBase.setUserType');
    try {
      return super.setUserType(value);
    } finally {
      _$EditAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$EditAccountStoreBaseActionController.startAction(
        name: 'EditAccountStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$EditAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$EditAccountStoreBaseActionController.startAction(
        name: 'EditAccountStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$EditAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass1(String value) {
    final _$actionInfo = _$EditAccountStoreBaseActionController.startAction(
        name: 'EditAccountStoreBase.setPass1');
    try {
      return super.setPass1(value);
    } finally {
      _$EditAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass2(String value) {
    final _$actionInfo = _$EditAccountStoreBaseActionController.startAction(
        name: 'EditAccountStoreBase.setPass2');
    try {
      return super.setPass2(value);
    } finally {
      _$EditAccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userType: ${userType},
name: ${name},
phone: ${phone},
pass1: ${pass1},
pass2: ${pass2},
loading: ${loading},
nameValid: ${nameValid},
phoneValid: ${phoneValid},
passValid: ${passValid},
isFormeValid: ${isFormeValid},
savePressed: ${savePressed}
    ''';
  }
}
