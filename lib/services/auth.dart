import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:bmi_calculator_app/models/user.dart';


abstract class AuthBase {
  Future currentUser();
  Future getCurrentUserInfo();
  Future signInAnonymously();
  Future signInWithEmailAndPassword(String email, String password);
  Future createUserWithEmailAndPassword(String email, String password, String name);
  Future signInWithGoogle();
  Future singOutGoogle();
  Future signOut();
}

class AuthService implements AuthBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Create user obj for FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  @override
  Future currentUser() async {
    final user = await _auth.currentUser();
    return _userFromFirebaseUser(user);
  }

  @override
  Future getCurrentUserInfo() async {
    return _auth.currentUser();
  }

  @override
  Future signInAnonymously() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      print('User is signed in anonymously');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      print('User is signed in with email and password');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future createUserWithEmailAndPassword(String email, String password, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // Uodate the username
      var userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = name;
      await user.updateProfile(userUpdateInfo);
      await user.reload();

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

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
    print('User is signed in with a google account');

    return 'signInWithGoogle succeeded: $user';
  }

  @override
  Future singOutGoogle() async {
    try {
      return await googleSignIn.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with apple

  @override
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
