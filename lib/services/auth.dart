import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  get userId => _auth.currentUser.uid;
  get userName =>
      _auth.currentUser != null ? _auth.currentUser.displayName : '';

  Future register({String email, String password, String fullName}) async {
    try {
      _auth
          .setPersistence(Persistence.SESSION)
          .then((value) => _auth.createUserWithEmailAndPassword(
                email: email,
                password: password,
              ));
      await _auth.currentUser.updateDisplayName(fullName);

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future login({String email, String password}) async {
    try {
      _auth.setPersistence(Persistence.SESSION).then((value) =>
          _auth.signInWithEmailAndPassword(email: email, password: password));
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future logout() async {
    _auth.setPersistence(Persistence.NONE).then((value) => _auth.signOut());
  }
}
