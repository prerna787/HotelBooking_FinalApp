import 'dart:convert';

import 'package:booking_app/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UserRepository {
  late String token ='';
  String userUrl = "http://10.0.2.2:8081/auth/login";
  Future<UserModel> loginUser(String username, String password) async {
    debugPrint('making request $username$password');
    try {
      Response response = await post(
        Uri.parse(userUrl),
        body: json.encode({'username': username, 'password': password}),
        headers: {

          "content-type":
              "application/json" ,
          'Accept': 'application/json',
          //'Authorization': 'Bearer$token'
        },
      );
      debugPrint('Request Done${response.statusCode == 200}');
      print('Token : ${token}');
      if (response.statusCode == 200) { 
        debugPrint(response.body);
        final result = jsonDecode(response.body) as Map<String, dynamic>;
        debugPrint('$result');
        debugPrint("User login success and his Token is : ${result ['token']}");

        return UserModel.fromJson(data: result);


      } else {
        debugPrint('terminate ${response.reasonPhrase}');
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      print('check the fault$e');
      rethrow;
    }
  }
}
