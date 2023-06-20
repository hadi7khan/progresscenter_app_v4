import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/common/data/exception.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/network/dio_client.dart';
import 'package:progresscenter_app_v4/src/core/providers/dio_provider.dart';

final authDataSourceProvider = Provider.autoDispose<AuthDataSource>((ref) {
  return AuthDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

abstract class AuthDataSource {
  Future signIn(data);
  Future forgotPassword(data);
  Future verifyEmail(data, token);
  Future changePassword(data, token);
  Future resendOTP(token);
}

class AuthDataSourceImpl implements AuthDataSource {
  final DioClient dioClient;
  AuthDataSourceImpl({required this.dioClient});

  @override
  Future forgotPassword(data) async {
    final response = await dioClient.post(Endpoints.forgotPasswordUrl(), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
  
  @override
  Future changePassword(data, token) async{
    final response = await dioClient.post(Endpoints.changePasswordUrl(token), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
  
  @override
  Future signIn(data) async{
    final response = await dioClient.post(Endpoints.signinUrl(), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
  
  @override
  Future resendOTP(token) async{
    final response = await dioClient.post(Endpoints.resendOtpUrl(token));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
}

  @override
  Future verifyEmail(data, token) async{
    final response = await dioClient.post(Endpoints.verifyEmailUrl(token), data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException();
    }
  }
}
