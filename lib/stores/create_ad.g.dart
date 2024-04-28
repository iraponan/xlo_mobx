// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ad.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAdStore on CreateAdStoreBase, Store {
  Computed<bool>? _$imagesValidComputed;

  @override
  bool get imagesValid =>
      (_$imagesValidComputed ??= Computed<bool>(() => super.imagesValid,
              name: 'CreateAdStoreBase.imagesValid'))
          .value;
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: 'CreateAdStoreBase.titleValid'))
          .value;
  Computed<bool>? _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: 'CreateAdStoreBase.descriptionValid'))
      .value;
  Computed<bool>? _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: 'CreateAdStoreBase.categoryValid'))
          .value;
  Computed<Address?>? _$addressComputed;

  @override
  Address? get address =>
      (_$addressComputed ??= Computed<Address?>(() => super.address,
              name: 'CreateAdStoreBase.address'))
          .value;
  Computed<num?>? _$priceComputed;

  @override
  num? get price => (_$priceComputed ??=
          Computed<num?>(() => super.price, name: 'CreateAdStoreBase.price'))
      .value;
  Computed<bool>? _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: 'CreateAdStoreBase.formValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'CreateAdStoreBase.sendPressed'))
          .value;

  late final _$titleAtom =
      Atom(name: 'CreateAdStoreBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'CreateAdStoreBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$categoryAtom =
      Atom(name: 'CreateAdStoreBase.category', context: context);

  @override
  Category? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$priceTextAtom =
      Atom(name: 'CreateAdStoreBase.priceText', context: context);

  @override
  String get priceText {
    _$priceTextAtom.reportRead();
    return super.priceText;
  }

  @override
  set priceText(String value) {
    _$priceTextAtom.reportWrite(value, super.priceText, () {
      super.priceText = value;
    });
  }

  late final _$hidePhoneAtom =
      Atom(name: 'CreateAdStoreBase.hidePhone', context: context);

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  late final _$showErrosAtom =
      Atom(name: 'CreateAdStoreBase.showErros', context: context);

  @override
  bool get showErros {
    _$showErrosAtom.reportRead();
    return super.showErros;
  }

  @override
  set showErros(bool value) {
    _$showErrosAtom.reportWrite(value, super.showErros, () {
      super.showErros = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'CreateAdStoreBase.loading', context: context);

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

  late final _$errorAtom =
      Atom(name: 'CreateAdStoreBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$savedAdAtom =
      Atom(name: 'CreateAdStoreBase.savedAd', context: context);

  @override
  bool get savedAd {
    _$savedAdAtom.reportRead();
    return super.savedAd;
  }

  @override
  set savedAd(bool value) {
    _$savedAdAtom.reportWrite(value, super.savedAd, () {
      super.savedAd = value;
    });
  }

  late final _$_sendAsyncAction =
      AsyncAction('CreateAdStoreBase._send', context: context);

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  late final _$CreateAdStoreBaseActionController =
      ActionController(name: 'CreateAdStoreBase', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo = _$CreateAdStoreBaseActionController.startAction(
        name: 'CreateAdStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$CreateAdStoreBaseActionController.startAction(
        name: 'CreateAdStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$CreateAdStoreBaseActionController.startAction(
        name: 'CreateAdStoreBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPriceText(String value) {
    final _$actionInfo = _$CreateAdStoreBaseActionController.startAction(
        name: 'CreateAdStoreBase.setPriceText');
    try {
      return super.setPriceText(value);
    } finally {
      _$CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool? value) {
    final _$actionInfo = _$CreateAdStoreBaseActionController.startAction(
        name: 'CreateAdStoreBase.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$CreateAdStoreBaseActionController.startAction(
        name: 'CreateAdStoreBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
category: ${category},
priceText: ${priceText},
hidePhone: ${hidePhone},
showErros: ${showErros},
loading: ${loading},
error: ${error},
savedAd: ${savedAd},
imagesValid: ${imagesValid},
titleValid: ${titleValid},
descriptionValid: ${descriptionValid},
categoryValid: ${categoryValid},
address: ${address},
price: ${price},
formValid: ${formValid},
sendPressed: ${sendPressed}
    ''';
  }
}
