import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/dio/dio_client.dart';
import 'package:flutter_application_1/dio/dio_exception.dart';
import 'package:flutter_application_1/dio/userModel.dart';

class GithubApi {
  DioClient _client = DioClient();

  Future<UserProfile?> getUserProfile({String? username}) async {
    try {
      final response =
          await Dio().get('https://api.github.com/users/$username');
      print(response.statusCode);

      return UserProfile.fromJson(response.data);
    } catch (e) {
      final mess = DioExceptions.fromDioError(e as DioError).toString();
      print('Error Message $mess');
    }
  }
}
