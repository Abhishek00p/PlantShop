// // user_model_adapter.dart
// import 'package:hive/hive.dart';
// import 'package:plantshop/models/user_model.dart';

// class UserAdapter extends TypeAdapter<AppUser> {
//   @override
//   AppUser read(BinaryReader reader) {
//     var fields = reader.readMap();
//     return AppUser(
//       username: fields['username'] as String? ?? '',
//       email: fields['email'] as String? ?? '',
//       userToken: fields['token'] as String? ?? '',
//       // age: fields['age'] as int?,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, AppUser obj) {
//     writer.writeMap({
//       'username': obj.username,
//       'email': obj.email,
//       'token': obj.userToken,
//       // 'age': obj.age,
//     });
//   }

//   @override
//   int get typeId => 0; // Unique ID for this type, can be any positive integer
// }
