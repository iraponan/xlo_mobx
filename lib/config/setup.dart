import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/stores/category.dart';
import 'package:xlo_mobx/stores/page.dart';
import 'package:xlo_mobx/stores/user_manager.dart';

abstract class Setups {
  static void setupLocators() {
    GetIt.I.registerSingleton(PageStore());
    GetIt.I.registerSingleton(UserManagerStore());
    GetIt.I.registerSingleton(CategoryStore());
  }
}
