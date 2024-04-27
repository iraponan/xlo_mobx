import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/repositories/zip_code.dart';

part 'zip_code.g.dart';

class ZipCodeStore = ZipCodeStoreBase with _$ZipCodeStore;

abstract class ZipCodeStoreBase with Store {
  ZipCodeStoreBase() {
    autorun(
      (p0) {
        if (clearZipCode.length != 8) {
          _reset();
        } else {
          _searchZipcode();
        }
      },
    );
  }

  @observable
  String zipCode = '';

  @action
  void setZipCode(String value) => zipCode = value;

  @computed
  String get clearZipCode => zipCode.replaceAll(RegExp('[^0-9]'), '') ?? '';

  @observable
  Address? address;

  @observable
  String error = '';

  @observable
  bool loading = false;

  @action
  Future<void> _searchZipcode() async {
    loading = true;
    try {
      address = await ZipCodeRepository().getAddressFromApi(clearZipCode);
      error = '';
    } catch (e) {
      error = e.toString();
    }
    loading = false;
  }

  @action
  void _reset() {
    address = null;
    error = '';
  }
}
