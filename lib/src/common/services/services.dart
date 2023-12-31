import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progressline_project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';
import 'package:http/http.dart' as http;

typedef ProgressCallback = void Function(double progress);

class Service {
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();

  //method to fetch progressline project list with minimum data
  Future<List<ProgresslineProjectModel>> progresslineProjectsList() async {
    final client = http.Client();
    final response = await client
        .get(Uri.parse(Endpoints.progressLineProjectsUrl()), headers: {
      "content-type": "application/json",
      "Authorization": "Bearer " + _prefsLocator.getUserToken(),
    });
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List<dynamic>;
      return jsonList
          .map((json) => ProgresslineProjectModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to fetch progressline project list');
    }
  }

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

  // method to update role for a specific user
  Future projectInvite(projectId, data) async {
    var postData = json.encode(data);
    print("post data" + data.toString());
    try {
      final client = http.Client();
      final response =
          await client.post(Uri.parse(Endpoints.projectInviteUrl(projectId)),
              headers: {
                "content-type": "application/json",
                "Authorization": "Bearer " + _prefsLocator.getUserToken(),
              },
              body: postData);
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        print("invite sent");
        return response.body;
      } else {
        throw Exception(response.body.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // method to edit details for a specific project
  Future editProject(projectId, data) async {
    var postData = json.encode(data);
    print("put data" + data.toString());
    try {
      final client = http.Client();
      final response =
          await client.put(Uri.parse(Endpoints.projectByIdUrl(projectId)),
              headers: {
                "content-type": "application/json",
                "Authorization": "Bearer " + _prefsLocator.getUserToken(),
              },
              body: postData);
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        print("project edited");
        return response.body;
      } else {
        throw Exception(response.body.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
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

  // method to delete file
  Future deleteFile(folderId, fileId) async {
    final client = http.Client();
    final response = await client
        .delete(Uri.parse(Endpoints.deleteFileUrl(folderId, fileId)), headers: {
      "content-type": "application/json",
      "Authorization": "Bearer " + _prefsLocator.getUserToken(),
    });
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print("file deleted");
      return response.body;
    } else {
      throw Exception('Failed to delete file');
    }
  }

  // method to delete user
  Future deleteUser(userId) async {
    final client = http.Client();
    final response = await client
        .delete(Uri.parse(Endpoints.userProfileUrl(userId)), headers: {
      "content-type": "application/json",
      "Authorization": "Bearer " + _prefsLocator.getUserToken(),
    });
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print("user deleted");
      return response.body;
    } else {
      throw Exception('Failed to delete user');
    }
  }

  // method to delete site gallery
  Future deleteSitegallery(projectId, siteGalleryId) async {
    final client = http.Client();
    final response = await client.delete(
        Uri.parse(Endpoints.siteGalleryByIdUrl(projectId, siteGalleryId)),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer " + _prefsLocator.getUserToken(),
        });
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print("site gallery deleted");
      return response.body;
    } else {
      throw Exception('Failed to delete user');
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

  // method to upload a list of files
  Future<dynamic> uploadFiles(String projectId, List<String?> filePaths) async {
    Dio dio = Dio();
    print("filepath---" + filePaths.toString());
    Map<String, String> headers = {
      // "Accept": "application/json",
      'Authorization': "Bearer ${_prefsLocator.getUserToken()}",
      "Content-Type": "multipart/form-data"
    };

    try {
      List<File> files = [];
      for (int i = 0; i < filePaths.length; i++) {
        files.add(File(filePaths[i]!));
      }

      FormData formData = FormData();
      formData = FormData.fromMap({});
      for (int i = 0; i < files.length; i++) {
        String fileName = filePaths[i]!.split('/').last;

        formData.files.add(MapEntry(
            'files',
            await MultipartFile.fromFile(
              filePaths[i]!,
              filename: fileName,
              contentType: Helper.getMediaType(fileName),
            )));
      }

      print("formdata passed " + formData.toString());

      dio.options.headers = headers;
      dio.options.contentType = Headers.formUrlEncodedContentType;

      await dio
          .post(
        Endpoints.siteGalleryListUrl(projectId),
        data: formData,
      )
          .then((response) {
        print("response body " + response.data.toString());
        // Check if the response is successful
        if (response.statusCode == 200) {
          // Parse the response data
          final responseData = response.data;
          return responseData;
        } else {
          // Handle error
          throw Exception("Error uploading files: ${response.statusCode}");
        }
      });
    } catch (e) {
      print(e.toString());
      throw Exception("Error uploading files: ${e.toString()}");
    }
  }

  // method to update role for a specific user
  Future roleChange(userId, data) async {
    var putData = json.encode(data);
    print("put data" + data.toString());
    final client = http.Client();
    final response = await client.put(Uri.parse(Endpoints.roleUrl(userId)),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer " + _prefsLocator.getUserToken(),
        },
        body: putData);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print("role updated");
      return response.body;
    } else {
      throw Exception('Failed to fetch user list');
    }
  }

  // method to update tags for a specific user
  Future teamChange(userId, data) async {
    var putData = json.encode(data);
    print("put data" + data.toString());
    final client = http.Client();
    final response = await client.put(Uri.parse(Endpoints.tagsUrl(userId)),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer " + _prefsLocator.getUserToken(),
        },
        body: putData);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print("team updated");
      return response.body;
    } else {
      throw Exception('Failed to fetch user list');
    }
  }

  // method to update staus for a specific user
  Future statusChange(userId, data) async {
    var putData = json.encode(data);
    print("put data" + data.toString());
    final client = http.Client();
    final response = await client.put(Uri.parse(Endpoints.statusUrl(userId)),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer " + _prefsLocator.getUserToken(),
        },
        body: putData);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print("status updated");
      return response.body;
    } else {
      throw Exception('Failed to fetch user list');
    }
  }

  // method to update projects for a specific user
  Future assignProjectChange(userId, data) async {
    var putData = json.encode(data);
    print("put data" + data.toString());
    final client = http.Client();
    final response = await client.put(Uri.parse(Endpoints.projectsUrl(userId)),
        headers: {
          "content-type": "application/json",
          "Authorization": "Bearer " + _prefsLocator.getUserToken(),
        },
        body: putData);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      print("projects updated");
      return response.body;
    } else {
      throw Exception('Failed to fetch user list');
    }
  }
}
