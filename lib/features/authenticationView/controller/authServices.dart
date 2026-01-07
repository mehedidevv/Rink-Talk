import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// SIGN UP
  Future<User?> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Something went wrong';
    }
  }

  /// SIGN IN (later use)
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Login failed';
    }
  }
}
