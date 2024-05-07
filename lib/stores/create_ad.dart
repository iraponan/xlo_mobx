import 'package:brasil_fields/brasil_fields.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/repositories/ad.dart';
import 'package:xlo_mobx/stores/postal_code.dart';
import 'package:xlo_mobx/stores/user_manager.dart';

part 'create_ad.g.dart';

class CreateAdStore = CreateAdStoreBase with _$CreateAdStore;

abstract class CreateAdStoreBase with Store {
  CreateAdStoreBase({required this.ad}) {
    title = ad.title ?? '';
    description = ad.description ?? '';
    images = ad.images?.asObservable() ?? ObservableList();
    category = ad.category;
    priceText = UtilBrasilFields.obterReal(
        double.tryParse(ad.price.toString()) ?? 0,
        moeda: true);
    hidePhone = ad.hidePhone ?? false;
    if (ad.address != null) {
      postalCodeStore =
          PostalCodeStore(initialPostalCode: ad.address?.postalCode);
    } else {
      postalCodeStore = PostalCodeStore();
    }
  }

  final Ad ad;

  late ObservableList images;
  late PostalCodeStore postalCodeStore;

  @computed
  bool get imagesValid => images.isNotEmpty;
  String get imagesError => imagesValid || !showErros ? '' : 'Insira imagens.';

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 5;
  String get titleError => titleValid || !showErros
      ? ''
      : title.isEmpty
          ? 'Campo Obrigatório.'
          : 'Titulo muito curto.';

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 10;
  String get descriptionError => descriptionValid || !showErros
      ? ''
      : description.isEmpty
          ? 'Campo Obrigatório.'
          : 'Descrição muito curta.';

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;

  @computed
  bool get categoryValid => category != null;
  String get categoryError =>
      categoryValid || !showErros ? '' : 'Campo Obrigatório.';

  @computed
  Address? get address => postalCodeStore.address;
  bool get addressValid => address != null;
  String get addressError =>
      addressValid || !showErros ? '' : 'Campo Obrigatório.';

  @observable
  String priceText = '';

  @action
  void setPriceText(String value) => priceText = value;

  @computed
  num? get price => num.tryParse(
      priceText.replaceAll(RegExp('[^0-9,]'), '').replaceAll(',', '.'));
  bool get priceValid => price != null && price! > 0;
  String get priceError => priceValid || !showErros
      ? ''
      : priceText.isEmpty
          ? 'Campo Obrigatório.'
          : 'Preço deve ser maior do que zero.';

  @observable
  bool hidePhone = false;

  @action
  void setHidePhone(bool? value) => hidePhone = value ?? false;

  @computed
  bool get formValid =>
      imagesValid &&
      titleValid &&
      descriptionValid &&
      categoryValid &&
      addressValid &&
      priceValid;

  @computed
  dynamic get sendPressed => formValid ? _send : null;

  @observable
  bool showErros = false;

  @action
  void invalidSendPressed() => showErros = true;

  @observable
  bool loading = false;

  @observable
  String error = '';

  @observable
  bool savedAd = false;

  @action
  Future<void> _send() async {
    ad.images = images;
    ad.title = title;
    ad.description = description;
    ad.category = category;
    ad.address = address;
    ad.price = price;
    ad.hidePhone = hidePhone;
    ad.user = GetIt.I<UserManagerStore>().user;

    loading = true;
    try {
      await AdRepository().save(ad);
      savedAd = true;
    } catch (e) {
      error = e.toString();
    }
    loading = false;
  }
}
