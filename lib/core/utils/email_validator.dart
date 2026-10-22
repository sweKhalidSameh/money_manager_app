class EmailValidator {
  static bool isValid(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  static String? validate(String? value) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    } else if (!isValid(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }
}
