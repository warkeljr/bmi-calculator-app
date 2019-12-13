import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';


// Creating the user
class User {
  User({@required this.uid});
  final String uid;
}

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> signinWithEmailAndPassword();
  Future<User> createWithEmailAndPassword();
  Future<User> signInAnonymously();

//Future<User> singInWithGoogle();

  Future<void> signOut();

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
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }
// Signin methods with email and password
  Future<User> signinWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }
// Create method with email and password  
  Future<User> createWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

// Signin method with anonymously
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
}

// Signin method with Google signin
  Future<User> singInWithGoogle() async {
    
  }

// Signin method with Facebook signin 

// Signout method
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  } 
}