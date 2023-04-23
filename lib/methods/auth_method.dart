import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socool/model/user_model.dart' as user_model;
import 'package:socool/screens/login_screen.dart';

import '../constants/constant.dart';
import '../widgets/show_snackbar.dart';

class AuthMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  ///////////////////////////////////////////////////////////
  ///------- Get user details for displaying
  ///////////////////////////////////////////////////////
  Future getUserDetails() async {
    if (firebaseAuth.currentUser == null) {
      return null;
    }
    User currentUser = firebaseAuth.currentUser!;
    DocumentSnapshot snapshot =
        await firebaseFirestore.collection("users").doc(currentUser.uid).get();

    return user_model.UserModel.fromSnap(snapshot);
  }

  ///////////////////////////////////////////////////////////
  ///------- Signup with Email & Password
  ///////////////////////////////////////////////////////
  Future<String> signUpEmailPasswordForm(
      {required String fullName,
      required String emailAddress,
      required String password}) async {
    String res = "Fields can't be empty or check internet connection";
    try {
      if (emailAddress.isNotEmpty || password.isNotEmpty) {
        var result = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );

        user_model.UserModel userModel = user_model.UserModel(
            uid: result.user!.uid,
            displayName: fullName,
            photoURL: kDefaultPhotoURL,
            emailAddress: result.user!.email!,
            accountType: kFreeAccount);

        firebaseFirestore
            .collection('users')
            .doc(result.user!.uid)
            .set(userModel.toJson());

        res = kSuccessResult;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        res = "Email is badly formatted";
      } else if (e.code == "weak-password") {
        res = "Password should be at least 6 characters";
      } else if (e.code == "email-already-in-use") {
        res = "Account already exists";
      }
    }

    return res;
  }

  ///////////////////////////////////////////////////////////
  ///------- Login with Email & Password
  ///////////////////////////////////////////////////////
  Future<String> loginEmailPassword(
      {required String email, required String password}) async {
    String res = "";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        res = kSuccessResult;
      } else {
        res = "Fields are required";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        res = "Password is incorrect";
      } else if (e.code == "user-not-found") {
        res = "User does not exist";
      } else if (e.code == "invalid-email") {
        res = "Email is badly formatted";
      }
    }

    return res;
  }

  ///////////////////////////////////////
  ///---------- sign out user
  ////////////////////////////////////////////
  Future<void> signOut(context) async {
    try {
      await firebaseAuth.signOut();
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(
      //     builder: ((context) => const LoginScreen()),
      //   ),
      // );

      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: context => LoginScreen()), (route) => false);

      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const LoginScreen()),
        (route) => false,
      );
    } catch (e) {
      showSnackBar(e.toString(), Colors.redAccent, context);
      rethrow;
    }
  }
}
