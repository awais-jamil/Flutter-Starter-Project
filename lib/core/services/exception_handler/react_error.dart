import 'package:json_annotation/json_annotation.dart';

part 'react_error.g.dart';

@JsonSerializable()
class ReactError {
  ReactError({required this.error});

  factory ReactError.fromJson(Map<String, dynamic> json) =>
      _$ReactErrorFromJson(json);

  final Error error;

  Map<String, dynamic> toJson() => _$ReactErrorToJson(this);
}

@JsonSerializable()
class Error {
  const Error(this.code, this.message);

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  final int code;
  final String message;

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
