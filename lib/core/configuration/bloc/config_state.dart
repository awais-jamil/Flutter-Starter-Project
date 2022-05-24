import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_app/core/configuration/bloc/config_bloc.dart';

part 'config_state.g.dart';

@JsonSerializable(explicitToJson: true)
class ConfigState extends Equatable {
  const ConfigState({
    required this.locale,
    this.appState = AppState.initial,
    required this.themeType,
  });

  factory ConfigState.fromJson(Map<String, dynamic> json) =>
      _$ConfigStateFromJson(json);

  final String locale;
  final ThemeType themeType;

  @JsonKey(ignore: true)
  final AppState appState;

  Map<String, dynamic> toJson() => _$ConfigStateToJson(this);

  @override
  List<Object> get props => [locale, themeType];

  ConfigState copyWith({
    String? locale,
    ThemeType? themeType,
    AppState? appState,
  }) =>
      ConfigState(
        locale: locale ?? this.locale,
        themeType: themeType ?? this.themeType,
        appState: appState ?? this.appState,
      );
}

enum AppState {
  @JsonValue('initial')
  initial,
  @JsonValue('changed')
  changed
}
