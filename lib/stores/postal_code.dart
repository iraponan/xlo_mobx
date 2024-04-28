import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/repositories/postal_code.dart';

part 'postal_code.g.dart';

class PostalCodeStore = PostalCodeStoreBase with _$PostalCodeStore;

abstract class PostalCodeStoreBase with Store {
  PostalCodeStoreBase() {
    autorun(
      (p0) {
        if (clearPostalCode.length != 8) {
          _reset();
        } else {
          _searchPostalCode();
        }
      },
    );
  }

  @observable
  String postalCode = '';

  @action
  void setPostalCode(String value) => postalCode = value;

  @computed
  String get clearPostalCode => postalCode.replaceAll(RegExp('[^0-9]'), '');

  @observable
  Address? address;

  @observable
  String error = '';

  @observable
  bool loading = false;

  @action
  Future<void> _searchPostalCode() async {
    loading = true;
    try {
      address = await PostalCodeRepository().getAddressFromApi(clearPostalCode);
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
