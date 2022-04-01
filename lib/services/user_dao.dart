// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserDao extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  String? userId() {
    return auth.currentUser?.uid;
  }

  String? email() {
    return auth.currentUser?.email;
  }

  void signup(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      //   if (e.code == 'weak-password') {
      //     debugPrint('The password provided is too weak.');
      //   } else if (e.code == 'email-already-in-use') {
      //     debugPrint('The account already exists for that email.');
      //   }
      // } catch (e) {
      //   debugPrint(e.toString());
      // }
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
    }
  }

  void logout() async {
    await auth.signOut();
    notifyListeners();
  }
}
