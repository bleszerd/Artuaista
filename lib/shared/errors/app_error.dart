class AppError {
  static throwNullEnvValueException(String envKey) {
    throw Exception("Env variable $envKey cannot be empty!");
  }
}
