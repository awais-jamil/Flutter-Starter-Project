import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_app/core/configuration/bloc/config_state.dart';
import 'package:mobile_app/core/configuration/theme/dark_theme.dart';
import 'package:mobile_app/core/configuration/theme/theme.dart';
import 'package:mobile_app/core/services/preferences_service.dart';
import 'package:mobile_app/utills/helpers.dart';

part 'config_event.dart';

class ConfigBloc extends HydratedBloc<ConfigEvent, ConfigState> {
  ConfigBloc({
    required DateTime dateTime,
    required this.sharedPrefs,
  }) : super(
          ConfigState(
            locale: dateTime.languageCode,
            themeType: ThemeType.defaultTheme,
          ),
        ) {
    hydrate();
    on<LocaleEvent>((event, emit) => setLocale(event, emit));
    on<ThemeEvent>((event, emit) => setTheme(event, emit));
  }

  final PreferencesService sharedPrefs;

  Future<void> setLocale(LocaleEvent event, Emitter emit) async {
    final locale = await _getLocale(event);
    emit(state.copyWith(locale: event.newLocale, appState: AppState.changed));
    sharedPrefs.setLocale(locale.languageCode);
  }

  Future<Locale> _getLocale(LocaleEvent event) async {
    if (event.newLocale != null) {
      return Locale(event.newLocale!);
    }
    final languageCode = await sharedPrefs.getLocale(currentLocale);
    return Locale(languageCode);
  }

  void setTheme(ThemeEvent event, Emitter emit) =>
      emit(state.copyWith(themeType: event.themeState));

  String get currentLocale => state.locale;

  @override
  ConfigState? fromJson(Map<String, dynamic>? json) {
    return json == null ? null : ConfigState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ConfigState state) {
    return state.toJson();
  }
}
