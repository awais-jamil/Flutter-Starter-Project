import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/core/services/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('Initialize PreferencesService', () {
    expect(PreferencesService(), isA<PreferencesService>());
  });

  test('call setToken', () {
    SharedPreferences.setMockInitialValues({'2': 'token'});
    expect(PreferencesService().setToken('token'), isA<Future>());
  });

  test('call getToken', () {
    SharedPreferences.setMockInitialValues({'2': 'token'});
    expectLater(PreferencesService().getToken(), completion('token'));
  });

  test('call clearToken', () {
    SharedPreferences.setMockInitialValues({'2': ''});
    expect(PreferencesService().clearToken(), isA<Future>());
  });

  test('call setLocale', () {
    SharedPreferences.setMockInitialValues({'1': ''});
    expect(PreferencesService().setLocale('locale'), isA<Future>());
  });

  test('call getLocale', () {
    SharedPreferences.setMockInitialValues({'1': 'ko'});
    expectLater(PreferencesService().getLocale('en'), completion('ko'));
  });

  test('call getLocale when no language set', () {
    SharedPreferences.setMockInitialValues({'2': ''});
    expectLater(PreferencesService().getLocale('en'), completion('en'));
  });

  test('call setLanguage', () {
    SharedPreferences.setMockInitialValues({});
    expect(PreferencesService().setLanguage(), isA<Future>());
  });

  test('call getLanguageStatus', () {
    SharedPreferences.setMockInitialValues({'10': true});
    expectLater(PreferencesService().getLanguageStatus(), completion(true));
  });
}
