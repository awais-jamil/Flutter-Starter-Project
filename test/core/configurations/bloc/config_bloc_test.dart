import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/core/configuration/bloc/config_bloc.dart';
import 'package:mobile_app/core/configuration/bloc/config_state.dart';
import 'package:mobile_app/core/services/preferences_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helper.dart';

void main() {
  final sharedPrefs = MockPreferenceService();

  test('Initialize ConfigBloc', () {
    expect(
      mockHydratedStorage(
        () => ConfigBloc(
          dateTime: DateTime(2020),
          sharedPrefs: MockPreferenceService(),
        ).state,
      ),
      isA<ConfigState>()
          .having(
            (p0) => p0.appState,
            'p0.appState',
            AppState.initial,
          )
          .having(
            (p0) => p0.locale,
            'p0.locale',
            'en',
          )
          .having(
            (p0) => p0.themeType,
            'p0.theme',
            ThemeType.defaultTheme,
          ),
    );
  });

  blocTest<ConfigBloc, ConfigState>(
    'emits [ConfigState] when LocaleEvent is added.',
    build: () {
      when(() => sharedPrefs.getLocale(any()))
          .thenAnswer((invocation) => Future.value('en'));
      when(() => sharedPrefs.setLocale(any()))
          .thenAnswer((invocation) => Future.value());
      return mockHydratedStorage(
        () => ConfigBloc(
          dateTime: DateTime(2020),
          sharedPrefs: sharedPrefs,
        ),
      );
    },
    act: (bloc) => bloc
      ..add(const LocaleEvent())
      ..add(const LocaleEvent(newLocale: 'ko')),
    expect: () => [
      isA<ConfigState>()
          .having(
            (p0) => p0.appState,
            'p0.appState',
            AppState.changed,
          )
          .having(
            (p0) => p0.locale,
            'p0.locale',
            'en',
          )
          .having(
            (p0) => p0.themeType,
            'p0.theme',
            ThemeType.defaultTheme,
          ),
      isA<ConfigState>().having(
        (p0) => p0.locale,
        'locale',
        'ko',
      )
    ],
  );

  blocTest<ConfigBloc, ConfigState>(
    'emits [ConfigState] when ThemeEvent is added.',
    build: () => mockHydratedStorage(
      () => ConfigBloc(
        dateTime: DateTime(2020),
        sharedPrefs: sharedPrefs,
      ),
    ),
    act: (bloc) => bloc..add(const ThemeEvent(ThemeType.defaultTheme)),
    expect: () => [
      isA<ConfigState>()
          .having((p0) => p0.themeType, 'p0.theme', ThemeType.defaultTheme),
    ],
  );
}
