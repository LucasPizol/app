import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Environment {
  static String baseUrl = dotenv.env['API_URL'] ?? 'http://localhost:8080';
  static String googleClientId = dotenv.env['GOOGLE_CLIENT_ID'] ?? '';
}
