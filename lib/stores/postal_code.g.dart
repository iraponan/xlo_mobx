// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postal_code.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostalCodeStore on PostalCodeStoreBase, Store {
  Computed<String>? _$clearPostalCodeComputed;

  @override
  String get clearPostalCode => (_$clearPostalCodeComputed ??= Computed<String>(
          () => super.clearPostalCode,
          name: 'PostalCodeStoreBase.clearPostalCode'))
      .value;

  late final _$postalCodeAtom =
      Atom(name: 'PostalCodeStoreBase.postalCode', context: context);

  @override
  String get postalCode {
    _$postalCodeAtom.reportRead();
    return super.postalCode;
  }

  @override
  set postalCode(String value) {
    _$postalCodeAtom.reportWrite(value, super.postalCode, () {
      super.postalCode = value;
    });
  }

  late final _$addressAtom =
      Atom(name: 'PostalCodeStoreBase.address', context: context);

  @override
  Address? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'PostalCodeStoreBase.error', context: context);

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

  late final _$loadingAtom =
      Atom(name: 'PostalCodeStoreBase.loading', context: context);

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

  late final _$_searchPostalCodeAsyncAction =
      AsyncAction('PostalCodeStoreBase._searchPostalCode', context: context);

  @override
  Future<void> _searchPostalCode() {
    return _$_searchPostalCodeAsyncAction.run(() => super._searchPostalCode());
  }

  late final _$PostalCodeStoreBaseActionController =
      ActionController(name: 'PostalCodeStoreBase', context: context);

  @override
  void setPostalCode(String value) {
    final _$actionInfo = _$PostalCodeStoreBaseActionController.startAction(
        name: 'PostalCodeStoreBase.setPostalCode');
    try {
      return super.setPostalCode(value);
    } finally {
      _$PostalCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _reset() {
    final _$actionInfo = _$PostalCodeStoreBaseActionController.startAction(
        name: 'PostalCodeStoreBase._reset');
    try {
      return super._reset();
    } finally {
      _$PostalCodeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postalCode: ${postalCode},
address: ${address},
error: ${error},
loading: ${loading},
clearPostalCode: ${clearPostalCode}
    ''';
  }
}
