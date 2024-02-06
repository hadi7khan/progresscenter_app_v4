import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/main.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';

class DioInterceptor extends Interceptor {
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  final context = rootNavigatorKey.currentContext;
  final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI3ODI4NjEwOSIsImlhdCI6MTY4Nzg0NzQ2OH0.0AOezzfGVTy3M55xQTjQRUWh6f0sgdBVIc-yx-ohQmU';

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = 'Bearer ' + _prefsLocator.getUserToken();
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
    if (err.response?.statusCode == 401) {
      _prefsLocator.logout();
      context!.go('/signin');
    }
    if (err.response?.statusCode == 404) {
      context!.push('/pageNotFound');
    }
    super.onError(err, handler);
  }
}
