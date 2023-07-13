import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preference_helper.dart';

final getIt = GetIt.instance;
final Dio _dio = Dio();

Future<void> setup() async {
  final _prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferenceHelper>(
    SharedPreferenceHelper(prefs: _prefs),
  );
  getIt.registerSingleton<DioClient>(DioClient( _dio));
}