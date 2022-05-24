import 'package:mobile_app/core/configuration/localization/strings.dart';

class Validators {
  factory Validators(Strings strings) {
    _singleton ??= Validators._internal();
    _singleton!._strings = strings;
    return _singleton!;
  }

  Validators._internal();

  late Strings _strings;

  static Validators? _singleton;

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return _strings.pleaseEnterEmail;
    }

    const String rawEmailRegex =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    final isValidEmail = RegExp(rawEmailRegex).hasMatch(email);

    if (!isValidEmail) {
      return _strings.validEmail;
    }

    return null;
  }

  String? validatePassword(String? password) {
    blankFieldValidation(password);

    if (blankFieldValidation(password)) {
      return _strings.pleaseEnterPassword;
    }

    if (password!.length < 8 || password.length > 70) {
      return _strings.pleaseEnterValidPassword;
    }
    const String _passwordRegex = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])';
    final bool isValid = RegExp(_passwordRegex).hasMatch(password);

    if (!isValid) {
      return _strings.pleaseEnterValidPassword;
    }

    return null;
  }

  bool blankFieldValidation(String? word) => word?.isEmpty ?? true;
}
