import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;
  User({this.uid});
}

abstract class AuthBase {

  Future signInAnonymously();
  Future createUserWithEmailAndPassword(String email, String password);
  Future signOut();

}

class AuthService extends AuthBase {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user obj for FirebaseUser

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Sign in anonymously
  @override
  Future signInAnonymously() async {
    try {
        AuthResult result = await _auth.signInAnonymously();
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email & password


  // Register with email & password
  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password); 
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


  // Sign in with google sign in
  
  
  // Sign in with facebook


  // Sign in with apple


  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}