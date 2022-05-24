import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_app/core/services/interceptors/auth_interceptor.dart';
import 'package:mobile_app/core/services/interceptors/log_interceptor.dart';
import 'package:mobile_app/core/services/retrofit/api_client.dart';
import 'package:mobile_app/environment_config.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiService {}

class ApiService {
  factory ApiService() {
    return _instance;
  }

  ApiService._() {
    client = _initApiClient();
  }

  static final _instance = ApiService._();
  late ApiClient client;
  final alice = Alice();

  ApiClient _initApiClient() {
    const int thirtySeconds = 30000;
    final globalDio = Dio(
      BaseOptions(
        connectTimeout: thirtySeconds,
        receiveTimeout: thirtySeconds,
        sendTimeout: thirtySeconds,
        followRedirects: true,
      ),
    );

    globalDio.interceptors.add(AuthInterceptor());

    if (!kReleaseMode) {
      globalDio.interceptors.addAll([
        alice.getDioInterceptor(),
        LogsInterceptor(),
      ]);
    }

    return ApiClient(
      globalDio,
      baseUrl: EnvironmentConfig.baseUrl,
    );
  }

  // Future<ResponseModel> someApi(RequestModel request) =>
  //     client.someApi(request);
}
