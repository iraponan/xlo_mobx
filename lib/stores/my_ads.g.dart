// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_ads.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyAdsStore on MyAdsStoreBase, Store {
  Computed<List<Ad>>? _$activeAdsComputed;

  @override
  List<Ad> get activeAds =>
      (_$activeAdsComputed ??= Computed<List<Ad>>(() => super.activeAds,
              name: 'MyAdsStoreBase.activeAds'))
          .value;

  late final _$alladsAtom =
      Atom(name: 'MyAdsStoreBase.allads', context: context);

  @override
  List<Ad> get allads {
    _$alladsAtom.reportRead();
    return super.allads;
  }

  @override
  set allads(List<Ad> value) {
    _$alladsAtom.reportWrite(value, super.allads, () {
      super.allads = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'MyAdsStoreBase.loading', context: context);

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

  late final _$soldAdAsyncAction =
      AsyncAction('MyAdsStoreBase.soldAd', context: context);

  @override
  Future<void> soldAd(Ad ad) {
    return _$soldAdAsyncAction.run(() => super.soldAd(ad));
  }

  late final _$deleteAdAsyncAction =
      AsyncAction('MyAdsStoreBase.deleteAd', context: context);

  @override
  Future<void> deleteAd(Ad ad) {
    return _$deleteAdAsyncAction.run(() => super.deleteAd(ad));
  }

  @override
  String toString() {
    return '''
allads: ${allads},
loading: ${loading},
activeAds: ${activeAds}
    ''';
  }
}
