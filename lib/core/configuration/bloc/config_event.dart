part of 'config_bloc.dart';

abstract class ConfigEvent {
  const ConfigEvent();
}

class LocaleEvent extends ConfigEvent {
  const LocaleEvent({this.newLocale});

  final String? newLocale;
}

class ThemeEvent extends ConfigEvent {
  const ThemeEvent(this.themeState);

  final ThemeType themeState;
}

enum ThemeType {
  @JsonValue('dark')
  defaultTheme
}

extension ThemeTypeX on ThemeType {
  BaseTheme get theme {
    switch (this) {
      case ThemeType.defaultTheme:
        return DarkTheme();
    }
  }
}
