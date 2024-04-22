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

  final category = ParseObject('Categories')
    ..set('Title', 'Camisetas')
    ..set('Position', 1);

  final response = await category.save();

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
