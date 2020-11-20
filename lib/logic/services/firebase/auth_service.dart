import 'package:firebase_auth/firebase_auth.dart';

class WrongPassword implements Exception {}

class AuthError implements Exception {}

class AuthService {
  var _auth = FirebaseAuth.instance;

  void onAuthStateChanged(void Function(User) callback) {
    _auth.authStateChanges().listen((callback));
  }

  loginWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      throw AuthError();
    } catch (e) {
      throw AuthError();
    }
  }
}
