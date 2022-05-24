// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'react_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactError _$ReactErrorFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ReactError',
      json,
      ($checkedConvert) {
        final val = ReactError(
          error: $checkedConvert(
              'error', (v) => Error.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ReactErrorToJson(ReactError instance) =>
    <String, dynamic>{
      'error': instance.error.toJson(),
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Error',
      json,
      ($checkedConvert) {
        final val = Error(
          $checkedConvert('code', (v) => v as int),
          $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
