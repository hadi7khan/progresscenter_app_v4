import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:http/http.dart' as http;

final authDataSourceProvider = Provider.autoDispose<AuthDataSource>((ref) {
  return AuthDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class AuthDataSource {
  Future signIn(Map<String, dynamic> data);
  Future forgotPassword(data);
  Future verifyEmail(data, token);
  Future changePassword(data, token);
  Future resendOTP(token);
  Future clientAccounts();
}

class AuthDataSourceImpl implements AuthDataSource {
  final locator = getIt.get<SharedPreferenceHelper>();
  final DioClient dioClient;
  AuthDataSourceImpl({required this.dioClient});

  @override
  Future forgotPassword(data) async {
    final response =
        await dioClient.post(Endpoints.forgotPasswordUrl(), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future changePassword(data, token) async {
    final response =
        await dioClient.post(Endpoints.changePasswordUrl(token), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future signIn(data) async {
    final body = json.encode(data);

    final client = http.Client();
    try {
      final response = await client.post(
        Uri.parse(Endpoints.signinUrl()),
        body: body,
        headers: {"Content-Type": "application/json"},
      );
      log("login response" + response.body.toString());

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        log("responseBody" + responseBody.toString());
        final token = responseBody['token'];

        await locator.setUserToken(userToken: token).then((value) {});
        return responseBody;
      } else {
        // log("exception " + e.toString());
        throw Exception(response.statusCode);
      }
    } catch (e) {
      log("exception " + e.toString());
      throw Exception(e);
    }
  }

  @override
  Future resendOTP(token) async {
    final response = await dioClient.post(Endpoints.resendOtpUrl(token));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future verifyEmail(data, token) async {
    final response =
        await dioClient.post(Endpoints.verifyEmailUrl(token), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }

  @override
  Future clientAccounts() async {
    final response = await dioClient.get(Endpoints.clientAccountsUrl());
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
