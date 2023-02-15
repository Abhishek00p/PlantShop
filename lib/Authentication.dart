import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

CreateUserEmaiAndPass(String Email, String password) async {
// Register a new user
  UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: Email, password: password);
}

LoginUserWithEmailAndPass(String Email, String password) async {
// Sign in an existing user
  UserCredential userCredential =
      await auth.signInWithEmailAndPassword(email: Email, password: password);
}
