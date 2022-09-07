import 'package:artuaista/features/error/domain/entities/app_error.dart';

abstract class ThrowExpectedAppErrorUsecase {
  void call(AppErrorCode errorCode, {String? extraMessage});
}
