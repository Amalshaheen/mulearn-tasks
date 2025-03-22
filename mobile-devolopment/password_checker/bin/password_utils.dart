import 'dart:math';

class PasswordUtility {
  String validatePassword(String password) {
    final hasUpper = password.contains(RegExp(r'[A-Z]'));
    final hasLower = password.contains(RegExp(r'[a-z]'));
    final hasDigit = password.contains(RegExp(r'\d'));
    final hasSpecial = password.contains(RegExp(r'[!@#\$&*~]'));
    final length = password.length;

    if (length >= 12 && hasUpper && hasLower && hasDigit && hasSpecial) {
      return "Strong";
    } else if (length >= 8 &&
        ((hasUpper && hasLower && hasDigit) ||
            (hasLower && hasDigit && hasSpecial))) {
      return "Intermediate";
    } else {
      return "Weak";
    }
  }

  String generatePassword(String level) {
    switch (level.toLowerCase()) {
      case 'strong':
        return _generateStrongPassword();
      case 'intermediate':
        return _generateIntermediatePassword();
      case 'low':
        return _generateLowPassword();
      default:
        throw FormatException(
            'Invalid level. Choose strong, intermediate, or low.');
    }
  }

  String _generateStrongPassword() {
    const length = 12;
    const upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowerCase = 'abcdefghijklmnopqrstuvwxyz';
    const digits = '0123456789';
    const special = '!@#\$&*~';
    final allChars = upperCase + lowerCase + digits + special;
    return _generateRandomString(length, allChars);
  }

  String _generateIntermediatePassword() {
    const length = 8;
    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const digits = '0123456789';
    final allChars = letters + digits;
    return _generateRandomString(length, allChars);
  }

  String _generateLowPassword() {
    const length = 6;
    const lowerCase = 'abcdefghijklmnopqrstuvwxyz';
    return _generateRandomString(length, lowerCase);
  }

  /// Helper method to generate a random string of [length] from [chars].
  String _generateRandomString(int length, String chars) {
    final rand = Random.secure();
    return List.generate(length, (_) => chars[rand.nextInt(chars.length)])
        .join();
  }
}
