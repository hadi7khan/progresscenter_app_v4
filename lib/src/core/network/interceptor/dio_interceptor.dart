import 'dart:developer';

import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  // final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyZXNlbGxlciI6IjYxY2FmMWRjY2IzYTgzOTZiMTE5YTExNyIsImlhdCI6MTY4NjcyNzg4NX0.ZRFWxtidQ5YXC-cvP_KvNB9wiDCW3HmrOLPkKcSiCi8';

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = 'Bearer ' + token;
    log("Request[${options.method}] => PATH: ${options.path}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("Response Status Code: [${response.statusCode}]");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("Error[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    super.onError(err, handler);
  }
}
