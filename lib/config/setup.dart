import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/stores/page.dart';

abstract class Setups {
  static void setupLocators() {
    GetIt.I.registerSingleton(PageStore());
  }
}