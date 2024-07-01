class AppRegex {
  static bool isNumber(String number) {
    return RegExp(r'^[+-]?[0-9]+(\.[0-9]+)?$').hasMatch(number);
  }
}
