import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future load() async {
    const env = String.fromEnvironment('ENVIRONMENT');
    return dotenv.load(fileName: 'environments/$env.env');
  }

  static String baseUrl = dotenv.env['BASE_URL']!;
  static String apiKey = dotenv.env['API_KEY']!;
}
