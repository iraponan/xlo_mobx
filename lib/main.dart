import 'package:flutter/material.dart';
import 'package:xlo_mobx/config/app.dart';
import 'package:xlo_mobx/config/initialize.dart';

Future<void> main() async {
  await Initialize.initializeParse();
  runApp(const AppXLOMobx());
}
