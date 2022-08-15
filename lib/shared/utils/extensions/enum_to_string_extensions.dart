extension EnumExtensions on Enum {
  String asString() {
    return toString().split('.').last;
  }
}
