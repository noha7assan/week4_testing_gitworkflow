import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/utils/validators.dart';

void main() {
  group('Email Validation', () {
    test('Valid email passes', () {
      expect(isValidEmail('test@example.com'), true);
    });

    test('Invalid email fails', () {
      expect(isValidEmail('a@'), false);
      expect(isValidEmail('@b.com'), false);
      expect(isValidEmail('plaintext'), false);
    });
  });

  group('Password Validation', () {
    test('Strong password passes', () {
      expect(isValidPassword('Abc@1234'), true);
    });

    test('Weak password fails', () {
      expect(isValidPassword('abc'), false);
      expect(isValidPassword('12345678'), false);
      expect(isValidPassword('Abcdefgh'), false);
    });
  });
}
