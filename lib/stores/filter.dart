import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/consts/vendor.dart';
import 'package:xlo_mobx/helpers/enums/order_by.dart';

part 'filter.g.dart';

class FilterStore = FilterStoreBase with _$FilterStore;

abstract class FilterStoreBase with Store {
  @observable
  OrderBy orderBy = OrderBy.date;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;

  @observable
  num? minPrice;

  @action
  void setMinPrice(num? value) => minPrice = value;

  @observable
  num? maxPrice;

  @action
  void setMaxPrice(num? value) => maxPrice = value;

  @computed
  String? get priceError =>
      maxPrice != null && minPrice != null && maxPrice! < minPrice!
          ? 'Faixa de preço inválida!'
          : null;

  @observable
  int vendoType = vendorTypeParticular;

  @action
  void selectVendorType(int type) => vendoType = type;
  void setVendorType(int type) => vendoType = vendoType | type;
  void resetVendorType(int type) => vendoType = vendoType & ~type;

  @computed
  bool get isTypeParticular => vendoType & vendorTypeParticular != 0;
  bool get isTypeProfessional => vendoType & vendorTypeProfessional != 0;
}
