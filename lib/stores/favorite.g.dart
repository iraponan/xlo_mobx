// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteStore on FavoriteStoreBase, Store {
  late final _$errorAtom =
      Atom(name: 'FavoriteStoreBase.error', context: context);

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

  late final _$_getFavoriteListAsyncAction =
      AsyncAction('FavoriteStoreBase._getFavoriteList', context: context);

  @override
  Future<void> _getFavoriteList() {
    return _$_getFavoriteListAsyncAction.run(() => super._getFavoriteList());
  }

  late final _$toggleFavoriteAsyncAction =
      AsyncAction('FavoriteStoreBase.toggleFavorite', context: context);

  @override
  Future<void> toggleFavorite(Ad ad) {
    return _$toggleFavoriteAsyncAction.run(() => super.toggleFavorite(ad));
  }

  @override
  String toString() {
    return '''
error: ${error}
    ''';
  }
}
