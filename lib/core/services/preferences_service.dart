import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockPreferenceService extends Mock implements PreferencesService {}

class PreferencesService {
  factory PreferencesService() {
    return _instance;
  }

  PreferencesService._internal();

  static final _instance = PreferencesService._internal();

  final _locale = '1';
  final _token = '2';
  final _manualSetLang = '10';

  Future<void> setToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_token, 'Token $token');
  }

  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final String? token = pref.getString(_token);
    return token ?? '';
  }

  Future<void> clearToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_token, '');
  }

  Future<void> setLocale(String locale) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_locale, locale);
  }

  Future<String> getLocale(String defaultLanguageCode) async {
    final pref = await SharedPreferences.getInstance();
    final String? locale = pref.getString(_locale);
    return locale ?? defaultLanguageCode;
  }

  Future<void> setLanguage({bool value = false}) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(_manualSetLang, value);
  }

  Future<bool?> getLanguageStatus() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(_manualSetLang);
  }
}
