import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/configuration/localization/strings.dart';
import 'package:mobile_app/core/services/api_state.dart';
import 'package:mobile_app/core/widgets/dialogs.dart';
import 'package:mobile_app/utills/app_routes.dart';
import 'package:mobile_app/utills/router_delegate.dart';

class ExceptionHandler {
  ApiErrorState<T> handleException<T>(DioError e) {
    if (e.error is SocketException) {
      return ApiErrorState(type: ErrorType.socket);
    } else {
      final statusCode = e.response?.statusCode;

      if (statusCode != null) {
        try {
          //TODO handle api responses 400, 404 etc
        } catch (e) {
          return ApiErrorState<T>(type: ErrorType.unknown);
        }
      }

      if (statusCode == null || statusCode >= 500) {
        return ApiErrorState<T>(type: ErrorType.unknown);
      }

      return ApiErrorState<T>(type: ErrorType.unknown);
    }
  }

  void showException(BuildContext context, ApiErrorState e) {
    switch (e.type) {
      case ErrorType.socket:
        Dialogs.of(context).showSingleButtonDialog(
          title: Strings.of(context).error,
          buttonTitle: Strings.of(context).ok,
          message: Strings.of(context).internetNotAvailable,
        );
        break;
      case ErrorType.serverMessage:
        Dialogs.of(context).showSingleButtonDialog(
          title: Strings.of(context).error,
          buttonTitle: Strings.of(context).ok,
          message: e.message!,
        );
        break;
      case ErrorType.authentication:
        Dialogs.of(context)
            .showSingleButtonDialog(
          title: Strings.of(context).logout,
          message: e.message!,
          buttonTitle: Strings.of(context).ok,
        )
            .then(
          (value) {
            AppRouterDelegate()
                .pushAndRemoveUntilPage(name: AppRouteConstants.landingPage);
          },
        );
        break;
      default:
        Dialogs.of(context).showSingleButtonDialog(
          title: Strings.of(context).error,
          buttonTitle: Strings.of(context).ok,
          message: Strings.of(context).somethingWentWrong,
        );
    }
  }
}
