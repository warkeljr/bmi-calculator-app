import 'package:firebase_auth/firebase_auth.dart';
import 'package:bmi_calculator_app/models/user.dart';

abstract class AuthBase {

  Future currentUser();
  Future signInAnonymously();
  Future signInWithEmailAndPassword(String email, String password);
  Future createUserWithEmailAndPassword(String email, String password);
  Future signOut();

}

class AuthService extends AuthBase {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user obj for FirebaseUser

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid,) : null;
  }
   
  @override
  Future currentUser() async {
    final user = await _auth.currentUser();
    return _userFromFirebaseUser(user);
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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password); 
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

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