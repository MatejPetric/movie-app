import 'package:flutter_dotenv/flutter_dotenv.dart';

final envConfig = EnvConfig();

class EnvConfig {
  static Future load() async {
    const env = String.fromEnvironment('ENVIRONMENT');
    return dotenv.load(fileName: 'environments/$env.env');
  }

  String baseUrl = dotenv.env['BASE_URL']!;
  String apiKey = dotenv.env['API_KEY']!;
  String bearer = dotenv.env['BEARER']!;
}
