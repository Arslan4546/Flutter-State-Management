class Validations {
  static bool emailValidation(String email) {
    final result = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    return result;
  }
}
