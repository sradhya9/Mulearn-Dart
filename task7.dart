import 'dart:io';
import 'dart:math';

class PasswordManager {
  // Character sets 
  final String _lowercase = 'abcdefghijklmnopqrstuvwxyz';
  final String _uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String _digits = '0123456789';
  final String _symbols = '!@#\$%^&*()_+-=[]{}|;:,.<>?';
  final Random _random = Random();

  // Validate password strength 
  String validatePassword(String password) {
    bool hasUpper = password.contains(RegExp(r'[A-Z]'));
    bool hasLower = password.contains(RegExp(r'[a-z]'));
    bool hasDigit = password.contains(RegExp(r'\d'));
    bool hasSymbol = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    if (password.length >= 12 && hasUpper && hasLower && hasDigit && hasSymbol) {
      return "Strong Password";
    } else if (password.length >= 8 &&
        ((hasUpper && hasLower) || (hasLower && hasDigit) || (hasUpper && hasDigit))) {
      return "Intermediate Password";
    } else {
      return "Weak Password";
    }
  }

  // Generate strong password 
  String generateStrongPassword([int length = 14]) {
    if (length < 12) length = 12;
    return _generatePassword(_lowercase + _uppercase + _digits + _symbols, length);
  }

  // Generate intermediate password 
  String generateIntermediatePassword([int length = 10]) {
    if (length < 8) length = 8;
    return _generatePassword(_lowercase + _uppercase + _digits, length);
  }

  // Generate low strength password 
  String generateLowPassword([int length = 6]) {
    if (length < 6) length = 6;
    return _generatePassword(_lowercase, length);
  }

  // Generate password from a given character set and length
  String _generatePassword(String chars, int length) {
    return List.generate(length, (_) => chars[_random.nextInt(chars.length)]).join();
  }
}

void main() {
  var pm = PasswordManager();

  while (true) {
    // Display menu options
    print('\n--- Password Manager ---');
    print('1. Check password strength');
    print('2. Generate a password');
    print('3. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      // Password strength check
      stdout.write('Enter password to check: ');
      String? password = stdin.readLineSync();
      if (password != null && password.isNotEmpty) {
        print('Password strength: ${pm.validatePassword(password)}');
      } else {
        print('No password entered.');
      }
    } else if (choice == '2') {
      // Password generation based on level
      print('Select password level to generate:');
      print('a. Strong');
      print('b. Intermediate');
      print('c. Low');
      stdout.write('Enter choice (a/b/c): ');
      String? level = stdin.readLineSync();

      String generated = '';
      switch (level) {
        case 'a':
          generated = pm.generateStrongPassword();
          break;
        case 'b':
          generated = pm.generateIntermediatePassword();
          break;
        case 'c':
          generated = pm.generateLowPassword();
          break;
        default:
          print('Invalid choice');
          continue;
      }
      print('Generated password ($level): $generated');
      print('Strength check: ${pm.validatePassword(generated)}');
    } else if (choice == '3') {
      // Exit program
      print('Exiting...');
      break;
    } else {
      print('Invalid choice, try again.');
    }
  }
}
