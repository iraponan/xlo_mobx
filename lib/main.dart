import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/config/theme.dart';
import 'package:xlo_mobx/pages/home.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'lib/config/.env');

  final String appName = dotenv.env['APP_NAME'] ?? '';
  final String serverUrl = dotenv.env['SERVER_URL'] ?? '';
  final String masterKey = dotenv.env['MASTER_KEY'] ?? '';

  runApp(const AppXLOMobx());
  await Parse().initialize(
    appName,
    serverUrl,
    masterKey: masterKey,
    autoSendSessionId: true,
    debug: true,
  );

  //Adicionando um objeto.
  final categories = ParseObject('Categories');
  /*categories.set<String>('Title', 'Meias');
  categories.set<int>('Position', 1);*/

  //Alterando um Objeto.
  /*categories.objectId = 'qGQ5C7Z4PO';
  categories.set('Position', 2);*/

  //Removendo um objeto.
  /*categories.objectId = 'qGQ5C7Z4PO';
  categories.delete();*/

  final response = await categories.save();

  print(response.success);
}

class AppXLOMobx extends StatelessWidget {
  const AppXLOMobx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO Mobx',
      debugShowCheckedModeBanner: false,
      theme: ThemeProject.theme,
      home: const HomePage(),
    );
  }
}
