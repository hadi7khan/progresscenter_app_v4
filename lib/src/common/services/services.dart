import 'dart:convert';

import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';
import 'package:http/http.dart' as http;

class Service {
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();

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
}
