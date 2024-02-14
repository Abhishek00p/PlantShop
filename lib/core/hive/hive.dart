import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:plantshop/core/hive/user_adapter.dart';
import 'package:plantshop/models/user_model.dart';

class HiveBoxes {
  /// use to get userbox instance
  static Box<String> get userBox => Hive.box<String>('userBox');
  static Box<String> get userCredentialBox => Hive.box<String>('userCredBox');

  /// Setup the hive box
  /// to open hive box call .openBox() method
  static Future<void> setupHive() async {
    // Set up the Hive box
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
  }

  /// Open the Hive box
  static Future<void> openBox() async {
    final userBox = await Hive.openBox<String>('userBox');
    final userCredentialBox = await Hive.openBox<String>('userCredBox');
  }

  /// This will close the connection of hive with app, Data will be present and will not be deleted
  /// recomended to do when closing app
  static Future<void> closeBox() async {
    await Hive.close();
  }

  /// it will clear all data in the box, the data will no longer can be found
  /// only recomended to use when user log out or user account deleted
  static void clearBoxData() async {
    await userBox.clear();
    await userCredentialBox.clear();
  }

  static Future<void> registerAdapters() async {
    // Hive.registerAdapter(UserAdapter());
  }

// some handy function provided below to use hive easily in app

  /// update user token, use this to update/Put or refresh user token in Hive
  static Future<void> updateUser({required AppUser appUser}) async {
    debugPrint('\n the appuser data  :${appUser.toJson()}\n');
    userBox.put('userData', json.encode(appUser.toJson()));
  }

  /// it will give user token
  /// which was stored during authentication of user
  static AppUser getUser() {
    final userdata = userBox.get('userData');
    return userdata == null
        ? AppUser.empty()
        : AppUser.fromjson(json: json.decode(userdata));
  }
}
