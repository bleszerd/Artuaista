enum AppErrorCode {
  generic,
  nullEnv,
  launchActionError,
  wallpaperCall,
}

class AppError implements Exception {
  final String? message;

  AppError.launch(this.message);
}
