import 'package:flutter/material.dart';
import 'package:xlo_mobx/config/app.dart';
import 'package:xlo_mobx/config/initialize.dart';
import 'package:xlo_mobx/config/setup.dart';

Future<void> main() async {
  await Initialize.initializeParse();
  Setups.setupLocators();
  runApp(const AppXLOMobx());
}
