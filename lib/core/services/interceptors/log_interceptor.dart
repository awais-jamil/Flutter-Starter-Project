import 'dart:developer';

import 'package:dio/dio.dart';

class LogsInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('<URI>\n${options.uri}');
    log('<HEADERS>\n${options.headers}');
    log('<METHOD>\n${options.method}');
    if (options.method == 'GET') {
      log('<QUERY PARAMETERS>\n${options.queryParameters}');
    } else if (options.data is FormData) {
      log('<FORM DATA>\n${(options.data as FormData).fields}');
    } else {
      log('<BODY>\n${options.data}');
    }

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log(err.type.toString());
    log(err.requestOptions.path);
    log(err.error.toString());
    if (err.response != null) log(err.response!.data.toString());
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('<STATUS CODE>\n${response.statusCode}');
    log('<PATH>\n${response.realUri.path}');
    log('<RESPONSE>\n${response.data}');

    return handler.next(response);
  }
}
