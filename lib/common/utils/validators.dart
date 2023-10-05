class Validators {
  static bool validateEmail(String value) {
    if (value.isEmpty) {
      return false;
    }
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return true;
    }
    return false;
  }

  static bool validatePassword(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return false;
    }
    if (value.length < 6) {
      return false;
    }
    if (RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)").hasMatch(value)) {
      return true;
    }
    return false;
  }
}
