// ignore_for_file: prefer__ructors, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dio/api.dart';
import 'package:flutter_application_1/dio/dio_exception.dart';
import 'package:flutter_application_1/dio/userModel.dart';

UserProfile? _user;
UserProfile get user => _user!;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();

    // final model = context.watch<UserProvider>();

    // Future<void> fetchUserInfo() async {
    //   await context
    //       .read<UserProvider>()
    //       .getUser(username: userNameController.text, ctx: context);
    // }
    GithubApi _githubApi = GithubApi();

    Future<void> getUser({String? username, BuildContext? ctx}) async {
      try {
        final UserProfile? response =
            await _githubApi.getUserProfile(username: username);
        _user = response;

        // Navigator.of(ctx!).pushNamed(AppRoutes.user_details);
      } catch (e) {
        // final errorMessage =
        //     DioExceptions.fromDioError(e as DioError).toString();
        print(e);
        // showCustomDialog(ctx, 'Error', errorMessage);

      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://icon-library.com/images/github-icon-white/github-icon-white-6.jpg',
            height: 100,
            width: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: userNameController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3.0)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                ),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: ElevatedButton(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Get my Github Profile'),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              onPressed: () =>
                  getUser(username: userNameController.text, ctx: context),
            ),
          )
        ],
      ),
    );
  }
}
