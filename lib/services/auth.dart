import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  String get userId => _auth.currentUser.uid;
  String get email => _auth.currentUser.email;
  get userName =>
      _auth.currentUser != null ? _auth.currentUser.displayName : '';

  Future register({String email, String password, String fullName}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _auth.currentUser.updateDisplayName(fullName);

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future login({String email, String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future logout() async {
    await _auth.signOut();
  }
}
