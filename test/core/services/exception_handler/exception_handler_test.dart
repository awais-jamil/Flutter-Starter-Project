import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/core/services/api_state.dart';
import 'package:mobile_app/utills/common_barrel.dart';

void main() {
  test('handleException on SocketException', () {
    final DioError error = DioError(
      requestOptions: RequestOptions(path: ''),
      error: const SocketException('message'),
    );

    final errorState = ExceptionHandler().handleException(error);
    expect(errorState, ApiErrorState(type: ErrorType.socket));
  });

  test('handleException on 401', () {
    final DioError error = DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 401,
        data: {
          'error': {
            'code': 401,
            'message': 'message',
          }
        },
      ),
    );

    final errorState = ExceptionHandler().handleException(error);
    expect(
      errorState,
      ApiErrorState(
        type: ErrorType.authentication,
        message: 'message',
      ),
    );
  });

  test('handleException on 400', () {
    final DioError error = DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 400,
        data: {
          'error': {
            'code': 400,
            'message': 'message',
          }
        },
      ),
    );

    final errorState = ExceptionHandler().handleException(error);
    expect(
      errorState,
      ApiErrorState(
        type: ErrorType.serverMessage,
        message: 'message',
      ),
    );
  });

  test('handleException on 400 parsing error', () {
    final DioError error = DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 400,
        data: {
          'error': {
            'code': 400,
            'mesage': 'message',
          }
        },
      ),
    );

    final errorState = ExceptionHandler().handleException(error);
    expect(
      errorState,
      ApiErrorState(
        type: ErrorType.unknown,
      ),
    );
  });

  test('handleException on 500', () {
    final DioError error = DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 500,
        data: {
          'error': {
            'code': 500,
            'mesage': 'message',
          }
        },
      ),
    );

    final errorState = ExceptionHandler().handleException(error);
    expect(
      errorState,
      ApiErrorState(
        type: ErrorType.unknown,
      ),
    );
  });

  test('handleException on null status code', () {
    final DioError error = DioError(
      requestOptions: RequestOptions(path: ''),
      response: Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: null,
        data: {
          'error': {
            'code': null,
            'mesage': 'message',
          }
        },
      ),
    );

    final errorState = ExceptionHandler().handleException(error);
    expect(
      errorState,
      ApiErrorState(
        type: ErrorType.unknown,
      ),
    );
  });
}
