import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// Creating the user
class User {
  User({@required this.uid});
  final String uid;
}

class Auth {
// Getting the FirebaseAuth instance
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;  
    }
    return User(uid: user.uid);
  }

// Getting the current user
  Future<User> currentUser() async{
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }
// Signin methods
  Future<User> signinWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }
  
  Future<User> createWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

// Signout method
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  } 
}