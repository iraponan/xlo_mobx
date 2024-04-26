import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/repositories/category.dart';

part 'category.g.dart';

class CategoryStore = CategoryStoreBase with _$CategoryStore;

abstract class CategoryStoreBase with Store {
  CategoryStoreBase() {
    _loadCategories();
  }

  ObservableList<Category> categoryList = ObservableList<Category>();

  @computed
  List<Category> get allCategoryList => List.from(categoryList)
    ..insert(0, Category(id: '*', description: 'Todos'));

  @action
  void setCategories(List<Category> categories) {
    categoryList.clear();
    categoryList.addAll(categories);
  }

  @observable
  String error = '';

  @action
  void setError(String value) => error = value;

  Future<void> _loadCategories() async {
    try {
      final categories = await CategoryRepository().getList();
      setCategories(categories);
    } catch (e) {
      setError(e.toString());
    }
  }
}
