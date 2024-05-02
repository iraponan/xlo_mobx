import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

abstract class Initialize {
  static Future<void> initializeEnv() async {
    await dotenv.load(fileName: 'lib/config/.env');
  }

  static Future<void> initializeParse() async {
    await Parse().initialize(
      dotenv.env['APP_NAME'] ?? '',
      dotenv.env['SERVER_URL'] ?? '',
      masterKey: dotenv.env['MASTER_KEY'] ?? '',
      autoSendSessionId: true,
      debug: true,
    );
  }
}
