// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PageStore on PageStoreBase, Store {
  late final _$pageAtom = Atom(name: 'PageStoreBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$PageStoreBaseActionController =
      ActionController(name: 'PageStoreBase', context: context);

  @override
  void setPage(int value) {
    final _$actionInfo = _$PageStoreBaseActionController.startAction(
        name: 'PageStoreBase.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$PageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page}
    ''';
  }
}
