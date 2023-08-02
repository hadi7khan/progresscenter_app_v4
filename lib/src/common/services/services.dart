import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';
import 'package:http/http.dart' as http;

typedef ProgressCallback = void Function(double progress);

class Service {
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();

  //method to fetch user list with minimum data
  Future<List<UserLeanModel>> fetchUserList() async {
    final client = http.Client();
    final response =
        await client.get(Uri.parse(Endpoints.userleanListUrl()), headers: {
      "content-type": "application/json",
      "Authorization": "Bearer " + _prefsLocator.getUserToken(),
    });
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List<dynamic>;
      return jsonList.map((json) => UserLeanModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch user list');
    }
  }

  // method to fetch team list
  Future<List<String>> fetchTeamList() async {
    final client = http.Client();
    final response =
        await client.get(Uri.parse(Endpoints.teamListUrl()), headers: {
      "content-type": "application/json",
      "Authorization": "Bearer " + _prefsLocator.getUserToken(),
    });
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body);
      var data = List<String>.from(jsonList);
      return data;
    } else {
      throw Exception('Failed to fetch user list');
    }
  }

  // method to revoke member access from a specific project
  Future revokeMember(projectId, userId) async {
    final client = http.Client();
    final response = await client.delete(
        Uri.parse(Endpoints.revokeMemberUrl(projectId, userId)),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer " + _prefsLocator.getUserToken(),
        });
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print("member revoked");
      return response.body;
    } else {
      throw Exception('Failed to fetch user list');
    }
  }

  // method to remove image
  Future deleteImage(projectId, imageId) async {
    final client = http.Client();
    final response = await client.delete(
        Uri.parse(Endpoints.deleteImageUrl(projectId, imageId)),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer " + _prefsLocator.getUserToken(),
        });
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print("image deleted");
      return response.body;
    } else {
      throw Exception('Failed to delete image');
    }
  }

  // method to upload image
  Future<dynamic> uploadPhoto(
      String projectId, String filePath, ProgressCallback onProgress) async {
    Dio dio = Dio();

    Map<String, String> headers = {
      "Accept": "application/json",
      'Authorization': "Bearer ${_prefsLocator.getUserToken()}"
    };

    try {
      String fileName = filePath.split('/').last;

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
      });

      dio.options.headers = headers;
      dio.options.responseType = ResponseType.stream;
      dio.options.followRedirects = false;
      dio.options.validateStatus = (status) => status! < 500;

      await dio.post(Endpoints.uploadImageUrl(projectId), data: formData,
          onSendProgress: (sentBytes, totalBytes) {
        double progress = sentBytes.toDouble() / totalBytes.toDouble();
        onProgress(progress);
      }).then((response) {
        if (response.statusCode == 200) {
          return response.data;
        } else {
          throw Exception(response.data.toString());
        }
      });
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}