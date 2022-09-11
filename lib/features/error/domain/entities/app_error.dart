enum AppErrorCode {
  generic,
  nullEnv,
  launchActionError,
}

class AppError implements Exception {
  final String? message;

  AppError.launch(this.message);
}
