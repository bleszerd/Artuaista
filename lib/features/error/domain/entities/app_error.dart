enum AppErrorCode {
  generic,
  nullEnv,
}

class AppError implements Exception {
  final String? message;

  AppError.launch(this.message);
}
