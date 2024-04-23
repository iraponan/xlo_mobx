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

  //Buscando um objeto especifico.
  /*final response = await ParseObject('Categories').getObject('CMhy5SshHU');
  if(response.success) {
    print(response.result);
  }*/

  //Buscando todos os objetos de uma classe.
  /*final response = await ParseObject('Categories').getAll();

  if(response.success) {
    for (final object in response.result) {
      print(response.result);
    }
  }*/

  //Buscando objetos por query. Coluna igual.
  /*final query = QueryBuilder(ParseObject('Categories'));
  query.whereEqualTo('Position', 2);

  final response = await query.query();

  if(response.success) {
    print(response.result);
  }*/

  //Buscando objetos por query. Coluna contém combinado com coluna igual.
  final query = QueryBuilder(ParseObject('Categories'));
  query.whereContains('Title', 'Blusas');
  query.whereEqualTo('Position', 2);

  final response = await query.query();

  if(response.success) {
    print(response.result);
  }
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
