import 'package:artuaista/features/error/domain/entities/app_error.dart';
import 'package:artuaista/features/error/domain/usecases/throw_expected_app_error/throw_expected_app_error_usecase.dart';
import 'package:artuaista/features/error/domain/usecases/throw_expected_app_error/throw_expected_app_error_usecase_impl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

ThrowExpectedAppErrorUsecase _throwExpectedAppErrorUsecase =
    ThrowExpectedAppErrorUsecaseImpl();

abstract class DotenvUtils {
  static const String _pexelsApiKey = "PEXELS_API_KEY";

  static String get pexelsApiKey {
    var envValue = dotenv.env[_pexelsApiKey];

    if (envValue == null) {
      _throwExpectedAppErrorUsecase(AppErrorCode.nullEnv);
    }

    return envValue!;
  }
}
