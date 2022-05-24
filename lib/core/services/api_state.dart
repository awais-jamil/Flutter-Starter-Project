import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app/core/services/exception_handler/exception_handler.dart';

abstract class ApiState<T> extends Equatable {}

class ApiSuccessState<T> extends ApiState<T> {
  ApiSuccessState({required this.data});

  final T data;

  @override
  List<Object?> get props => [data];
}

class ApiLoadingState extends ApiState {
  @override
  List<Object?> get props => [];
}

class ApiErrorState<T> extends ApiState<T> {
  ApiErrorState({required this.type, this.message});

  final ErrorType type;
  final String? message;

  @override
  List<Object?> get props => [type, message];
}

enum ErrorType {
  socket,
  unknown,
  serverMessage,
  authentication,
}

Future<ApiState<T>> apiCall<T>(
  Future<T> Function() f,
) async {
  try {
    final T response = await f();
    return ApiSuccessState<T>(data: response);
  } on DioError catch (e) {
    return ExceptionHandler().handleException<T>(e);
  }
}
