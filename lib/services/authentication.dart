import 'package:firebase_auth/firebase_auth.dart';
import 'package:medpoint/locator.dart';
import 'package:medpoint/models/user.dart';
import 'package:medpoint/services/firestore_service.dart';

class AuthenticationHelper {
  final _firestoreService = locator<FirestoreService>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  // SIGN UP METHOD
  Future signUpWithEmail({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? gender,
    String? dateOfBirth,
  }) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      await _firestoreService.createUser(Individual(
          uid: authResult.user!.uid,
          firstname: firstName,
          lastname: lastName,
          gender: gender,
          dateOfBirth: dateOfBirth,
          email: email));

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // SIGN IN METHOD
  Future signIn({String? email, String? password}) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();
  }

  // CHECK IF USER IS LOGGED IN
  Future<bool> isUserLoggedIn() async {
    var _user = await user;
    return _user != null;
  }
}
