import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:plantshop/core/constants.dart';
import 'package:plantshop/core/core.dart';
import 'package:plantshop/core/error/exception.dart';
import 'package:plantshop/core/hive/hive.dart';
import 'package:plantshop/models/user_model.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

CreateUserEmaiAndPass(String Email, String password) async {
// Register a new user
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: Email, password: password);
    return {"status": 200, "mesg": "User created successfully"};
  } catch (e) {
    if (e.toString().contains("connection")) {
      return {"status": 100, "mesg": "Check your Internet Connection"};
    } else {
      return {"status": 100, "mesg": e.toString()};
    }
  }
}

LoginUserWithEmailAndPass(String Email, String password) async {
// Sign in an existing user
  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: Email, password: password);
    return {"status": 200, "mesg": "User created successfully"};
  } catch (e) {
    if (e.toString().contains("user not found")) {
      return {"status": 100, "mesg": "Check your Internet Connection"};
    } else {
      return {"status": 100, "mesg": e.toString()};
    }
  }
}

signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final cred = await FirebaseAuth.instance.signInWithCredential(credential);
    return {"status": 200, "mesg": "Logged in"};
  } catch (e) {
    return {"status": 100, "mesg": e.toString()};
  }
}

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

  Future<void> refreshUserSession() async {
    final userEmail = HiveBoxes.userCredentialBox.get('email');
    final userPassword = HiveBoxes.userCredentialBox.get('password');
    try {
      return loginWithEmailAndPassword(
          email: userEmail ?? '', password: userPassword ?? '');
    } catch (e) {
      rethrow;
    }
  }
}
