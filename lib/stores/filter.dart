import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/enums/order_by.dart';

part 'filter.g.dart';

class FilterStore = FilterStoreBase with _$FilterStore;

abstract class FilterStoreBase with Store {
  @observable
  OrderBy orderBy = OrderBy.date;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;
}
