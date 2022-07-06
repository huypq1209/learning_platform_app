// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/dio/api.dart';
// import 'package:flutter_application_1/dio/dio_exception.dart';
// import 'package:flutter_application_1/dio/userModel.dart';

// class UserProvider extends ChangeNotifier {
//   GithubApi _githubApi = GithubApi();

//   bool isLoading = false;

//   UserProfile? _user;
//   UserProfile get user => _user!;

//   void setLoading(bool value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   Future<void> getUser({String? username, BuildContext? ctx}) async {
//     setLoading(true);
//     try {
//       final UserProfile response =
//           // await _githubApi.getUserProfile(username: username);
//       // _user = response;

//       setLoading(false);
//       // Navigator.of(ctx!).pushNamed(AppRoutes.user_details);
//     } catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
//       print(errorMessage);
//       // showCustomDialog(ctx, 'Error', errorMessage);
//       setLoading(false);
//     }
//   }
// }
