// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigState _$ConfigStateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ConfigState',
      json,
      ($checkedConvert) {
        final val = ConfigState(
          locale: $checkedConvert('locale', (v) => v as String),
          themeType: $checkedConvert(
              'theme_type', (v) => $enumDecode(_$ThemeTypeEnumMap, v)),
        );
        return val;
      },
      fieldKeyMap: const {'themeType': 'theme_type'},
    );

Map<String, dynamic> _$ConfigStateToJson(ConfigState instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'theme_type': _$ThemeTypeEnumMap[instance.themeType],
    };

const _$ThemeTypeEnumMap = {
  ThemeType.defaultTheme: 'dark',
};
