import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
