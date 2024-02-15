import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plantshop/core/constants.dart';
import 'package:plantshop/core/core.dart';
import 'package:plantshop/core/error/exception.dart';
import 'package:plantshop/core/hive/hive.dart';
import 'package:plantshop/models/user_model.dart';
import 'package:http/http.dart' as http;

class MongoAuth {
  static Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
    // required String bToken
  }) async {
    try {
      final mybody = json.encode({'email': email, 'password': password});
      final response = await http.post(Uri.parse('${baseUrl}user/login'),
          headers: headers, body: mybody);

      debugPrint(
          'body sent was : $mybody \n auth response => ${response.statusCode} ${response.body}');
      if (response.statusCode == 200) {
        HiveBoxes.openBox();
        final user = AppUser.fromjson(json: jsonDecode(response.body)['user']);
        await HiveBoxes.updateUser(appUser: user);
        await HiveBoxes.userCredentialBox.put('email', email);
        await HiveBoxes.userCredentialBox.put('password', password);
        // await HiveBoxes.userBox.put('userData', user);
      } else {
        throw UserAuthFailException('fail to login user');
      }
    } catch (e) {
      debugPrint('eror catched : $e');
      if (e is UserAuthFailException) {
        rethrow;
      } else {
        throw SomethingWentWrongException(
            'Something Wrong happen while authenticating user');
      }
    }
  }

  static Future<String> getUserToken() async {
    final user = HiveBoxes.getUser();
    try {
      if (!user.isEmpty) {
        final mybody = {'email': user.email};

        final response = await http.post(
            Uri.parse('${baseUrl}tokenRefresh/refresh'),
            headers: headers,
            body: json.encode(mybody));
        if (response.statusCode == 200) {
          return json.decode(response.body)['message'].toString();
        } else {
          throw SomethingWentWrongException(
              'Something went wrong .. ${response.statusCode}');
        }
      } else {
        throw SomethingWentWrongException('user data not found in Hive...');
      }
    } catch (e) {
      rethrow;
    }
  }
}
