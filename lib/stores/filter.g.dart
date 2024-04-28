// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FilterStore on FilterStoreBase, Store {
  Computed<String>? _$priceErrorComputed;

  @override
  String get priceError =>
      (_$priceErrorComputed ??= Computed<String>(() => super.priceError,
              name: 'FilterStoreBase.priceError'))
          .value;
  Computed<bool>? _$isTypeParticularComputed;

  @override
  bool get isTypeParticular => (_$isTypeParticularComputed ??= Computed<bool>(
          () => super.isTypeParticular,
          name: 'FilterStoreBase.isTypeParticular'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'FilterStoreBase.isFormValid'))
          .value;

  late final _$orderByAtom =
      Atom(name: 'FilterStoreBase.orderBy', context: context);

  @override
  OrderBy get orderBy {
    _$orderByAtom.reportRead();
    return super.orderBy;
  }

  @override
  set orderBy(OrderBy value) {
    _$orderByAtom.reportWrite(value, super.orderBy, () {
      super.orderBy = value;
    });
  }

  late final _$minPriceAtom =
      Atom(name: 'FilterStoreBase.minPrice', context: context);

  @override
  num? get minPrice {
    _$minPriceAtom.reportRead();
    return super.minPrice;
  }

  @override
  set minPrice(num? value) {
    _$minPriceAtom.reportWrite(value, super.minPrice, () {
      super.minPrice = value;
    });
  }

  late final _$maxPriceAtom =
      Atom(name: 'FilterStoreBase.maxPrice', context: context);

  @override
  num? get maxPrice {
    _$maxPriceAtom.reportRead();
    return super.maxPrice;
  }

  @override
  set maxPrice(num? value) {
    _$maxPriceAtom.reportWrite(value, super.maxPrice, () {
      super.maxPrice = value;
    });
  }

  late final _$vendoTypeAtom =
      Atom(name: 'FilterStoreBase.vendoType', context: context);

  @override
  int get vendoType {
    _$vendoTypeAtom.reportRead();
    return super.vendoType;
  }

  @override
  set vendoType(int value) {
    _$vendoTypeAtom.reportWrite(value, super.vendoType, () {
      super.vendoType = value;
    });
  }

  late final _$FilterStoreBaseActionController =
      ActionController(name: 'FilterStoreBase', context: context);

  @override
  void setOrderBy(OrderBy value) {
    final _$actionInfo = _$FilterStoreBaseActionController.startAction(
        name: 'FilterStoreBase.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinPrice(num? value) {
    final _$actionInfo = _$FilterStoreBaseActionController.startAction(
        name: 'FilterStoreBase.setMinPrice');
    try {
      return super.setMinPrice(value);
    } finally {
      _$FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxPrice(num? value) {
    final _$actionInfo = _$FilterStoreBaseActionController.startAction(
        name: 'FilterStoreBase.setMaxPrice');
    try {
      return super.setMaxPrice(value);
    } finally {
      _$FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectVendorType(int type) {
    final _$actionInfo = _$FilterStoreBaseActionController.startAction(
        name: 'FilterStoreBase.selectVendorType');
    try {
      return super.selectVendorType(type);
    } finally {
      _$FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderBy: ${orderBy},
minPrice: ${minPrice},
maxPrice: ${maxPrice},
vendoType: ${vendoType},
priceError: ${priceError},
isTypeParticular: ${isTypeParticular},
isFormValid: ${isFormValid}
    ''';
  }
}
