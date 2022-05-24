import 'package:dio/dio.dart';
import 'package:mobile_app/core/services/preferences_service.dart';
import 'package:mobile_app/utills/helpers.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final PreferencesService repository = PreferencesService();
    options.headers['Authorization'] = await repository.getToken();
    options.headers['Accept-Language'] = await repository.getLocale('en');
    options.headers['X-APP-VERSION'] = (await getPackageInfo()).version;
    return handler.next(options);
  }
}
