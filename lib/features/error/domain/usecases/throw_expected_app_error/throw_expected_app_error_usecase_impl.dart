import 'package:artuaista/features/error/domain/entities/app_error.dart';
import 'package:artuaista/features/error/domain/usecases/throw_expected_app_error/throw_expected_app_error_usecase.dart';

class ThrowExpectedAppErrorUsecaseImpl implements ThrowExpectedAppErrorUsecase {
  @override
  void call(AppErrorCode errorCode, {String? extraMessage}) {
    switch (errorCode) {
      case AppErrorCode.nullEnv:
        throw AppError.launch(
          "Null enviroment variable provided, check your environment project file.\n$extraMessage",
        );
      case AppErrorCode.launchActionError:
        throw AppError.launch(
          "An intent has launched without data or with invalid params.\n$extraMessage",
        );
      default:
        throw AppError.launch(
          "An expected error occurred but was not specified by the developer.\n$extraMessage",
        );
    }
  }
}
