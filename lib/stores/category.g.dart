// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryStore on CategoryStoreBase, Store {
  Computed<List<Category>>? _$allCategoryListComputed;

  @override
  List<Category> get allCategoryList => (_$allCategoryListComputed ??=
          Computed<List<Category>>(() => super.allCategoryList,
              name: 'CategoryStoreBase.allCategoryList'))
      .value;

  late final _$errorAtom =
      Atom(name: 'CategoryStoreBase.error', context: context);

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

  late final _$CategoryStoreBaseActionController =
      ActionController(name: 'CategoryStoreBase', context: context);

  @override
  void setCategories(List<Category> categories) {
    final _$actionInfo = _$CategoryStoreBaseActionController.startAction(
        name: 'CategoryStoreBase.setCategories');
    try {
      return super.setCategories(categories);
    } finally {
      _$CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$CategoryStoreBaseActionController.startAction(
        name: 'CategoryStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
allCategoryList: ${allCategoryList}
    ''';
  }
}
