import 'package:customer_listing_app/utils/ApiRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationHelper {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;


  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  //SIGN UP METHOD
  Future<String?> signUp(String? email, String? password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      ).then((value) {
        return "Logged In Successfully";
      }).whenComplete(() {
        return "Logged In Successfully";
      });
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
    catch (signUpError) {
      if (signUpError is PlatformException) {
        if (signUpError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          /// `foo@bar.com` has alread been registered.
          return "$email already exists , Do you want to Login?";
        }
      }
    }
  }

  //SIGN IN METHOD
  Future signIn({String? email, String? password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email!, password: password!);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();
    print('signout');
  }


  //Google Sign In
  Future<bool> handleGoogleSignIn() async {
    bool signedInSuccessful = false;
    try {
      await _googleSignIn.signIn().then((value) async {
        print("_googleSignIn.currentUser?.email");
        print(_googleSignIn.currentUser?.email);
        await ApiRepository().AddUser(_googleSignIn.currentUser?.email, "password");
        signedInSuccessful = true;
      }).whenComplete(() async {
        print("_googleSignIn.currentUser?.email");
        print(_googleSignIn.currentUser?.email);
        await ApiRepository().AddUser(_googleSignIn.currentUser?.email, "password");
        signedInSuccessful = true;
      });
    } catch (error) {
      print(error);
    }
    return signedInSuccessful;
  }

  //Google Sign Out
  Future<void> handleGoogleSignOut() => _googleSignIn.disconnect();

}