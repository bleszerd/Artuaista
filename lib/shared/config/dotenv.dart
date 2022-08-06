import 'package:artuaista/shared/errors/app_error.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Dotenv {
  static const String _pexelsApiKey = "PEXELS_API_KEY";

  static String get pexelsApiKey {
    var envValue = dotenv.env[_pexelsApiKey];

    if (envValue == null) {
      AppError.throwNullEnvValueException("envValue");
    }

    return envValue!;
  }
}
