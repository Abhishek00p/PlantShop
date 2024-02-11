import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:plantshop/models/user_model.dart';

class HiveBoxes {
  /// use to get userbox instance
  static Box<AppUser> get userBox => Hive.box<AppUser>('userBox');

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
    final userBox = await Hive.openBox<AppUser>('userBox');
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
  }

// some handy function provided below to use hive easily in app

  /// update user token, use this to update/Put or refresh user token in Hive
  static void updateUser({required AppUser appUser}) async {
    userBox.put('userData', appUser);
  }

  /// it will give user token
  /// which was stored during authentication of user
  static AppUser getUser() {
    return userBox.get('userData') ?? AppUser.empty();
  }
}
