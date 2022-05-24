import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/core/configuration/localization/strings.dart';
import 'package:mobile_app/utills/validators.dart';
import 'package:mocktail/mocktail.dart';

class MockStrings extends Mock implements Strings {}

void main() {
  final Strings strings = MockStrings();

  test('instantiate Validators', () {
    expect(Validators(MockStrings()), isA<Validators>());
  });

  group('test validateEmail', () {
    test('invalid email', () {
      const message = 'enter valid email';
      when(() => strings.validEmail).thenAnswer((invocation) => message);
      expect(Validators(strings).validateEmail('abx'), message);
    });

    test('valid email', () {
      expect(Validators(strings).validateEmail('abc@gmail.com'), null);
    });

    test('validate empty string', () {
      const message = 'please enter email';
      when(() => strings.pleaseEnterEmail).thenAnswer((invocation) => message);
      expect(Validators(strings).validateEmail(''), message);
    });

    test('validate null value', () {
      const message = 'please enter email';
      when(() => strings.pleaseEnterEmail).thenAnswer((invocation) => message);
      expect(Validators(strings).validateEmail(null), message);
    });
  });

  group('test validatePassword', () {
    test('invalid password < 7', () {
      const message = 'enter valid password';
      when(() => strings.pleaseEnterValidPassword)
          .thenAnswer((invocation) => message);
      expect(Validators(strings).validatePassword('password'), message);
    });

    test('invalid password > 70', () {
      const message = 'enter valid password';
      when(() => strings.pleaseEnterValidPassword)
          .thenAnswer((invocation) => message);
      expect(
        Validators(strings)
            .validatePassword(List.generate(71, (index) => 'a').toString()),
        message,
      );
    });

    test('valid password', () {
      expect(Validators(strings).validatePassword('Rn1234567'), null);
    });

    test('validate empty string', () {
      const message = 'please enter password';
      when(() => strings.pleaseEnterPassword)
          .thenAnswer((invocation) => message);
      expect(Validators(strings).validatePassword(''), message);
    });

    test('validate null value', () {
      const message = 'please enter password';
      when(() => strings.pleaseEnterPassword)
          .thenAnswer((invocation) => message);
      expect(Validators(strings).validatePassword(null), message);
    });
  });
}
