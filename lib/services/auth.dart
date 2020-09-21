import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:bmi_calculator_app/models/user.dart';
import 'package:bmi_calculator_app/services/database.dart';

abstract class AuthBase {
  Future currentUser();
  Future signInAnonymously();
  Future signInWithEmailAndPassword(String email, String password);
  Future createUserWithEmailAndPassword(String email, String password);
  Future signInWithGoogle();
  Future signOut();
}

class AuthService implements AuthBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Create user obj for FirebaseUser

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
  
  Stream<User> get user{
     return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));
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
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // create new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('BMI ok', '200', 'Slightly underweight');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email & password
  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // create new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('BMI ok', '90', 'Slightly underweight');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with google sign in
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }

  // Sign out with Google
  Future singOutGoogle() async {
    try {
      return await googleSignIn.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with apple

  // Sign out
  Future signOut() async {
    try {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
