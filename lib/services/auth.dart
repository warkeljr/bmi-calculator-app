import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:bmi_calculator_app/models/user.dart';


abstract class AuthBase {
  Future currentUser();
  Future getCurrentUserInfo();
  Future signInAnonymously();
  Future signInWithEmailAndPassword(String? email, String? password);
  Future createUserWithEmailAndPassword(String? email, String? password, String?
   name);
  Future signInWithGoogle();
  Future singOutGoogle();
  // Future singInWithApple();
  Future signOut();
}

class AuthService implements AuthBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Create user obj for FirebaseUser
  UserMod? _userFromFirebaseUser(User user) {
    return UserMod(uid: user.uid);
  }

  Stream<UserMod> get user {
    return _auth.authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }

  @override
  Future currentUser() async {
    final user = _auth.currentUser;
    return _userFromFirebaseUser(user);
  }

  @override
  Future getCurrentUserInfo() async {
    return _auth.currentUser;
  }

  @override
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
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
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
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
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      // Update the username
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

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
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
  // Future singInWithApple() async {
    
  // }

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
