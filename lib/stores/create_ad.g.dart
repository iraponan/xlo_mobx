// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ad.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAdStore on CreateAdStoreBase, Store {
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

  late final _$CreateAdStoreBaseActionController =
      ActionController(name: 'CreateAdStoreBase', context: context);

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
  String toString() {
    return '''
category: ${category},
hidePhone: ${hidePhone}
    ''';
  }
}
