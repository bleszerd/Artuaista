class GenericAppError {
  final GenericAppErrorCodes? code;

  GenericAppError({
    this.code = GenericAppErrorCodes.generic,
  });
}

enum GenericAppErrorCodes {
  generic,
}
