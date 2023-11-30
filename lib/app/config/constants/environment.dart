import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiKey1 = dotenv.env['API_KEY_1'] ?? 'No hay api key';
  static String apiKey2 = dotenv.env['API_KEY_2'] ?? 'No hay api key';
}
