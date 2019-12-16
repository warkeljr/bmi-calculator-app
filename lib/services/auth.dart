import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';


// Creating the user
class User {
  User({@required this.uid});
  final String uid;
}

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class Auth implements AuthBase {
// Getting the FirebaseAuth instance
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;  
    }
    return User(uid: user.uid);
  }

// Getting the current user
  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  // Signin method with anonymously
  @override
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }
// Signin methods with email and password
  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

// Create method with email and password  
  @override
  Future<User> createUserWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

// Signin method with Google signin
  //Future<User> singInWithGoogle() async {}

// Signin method with Facebook signin 

// Signout method
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  } 
}