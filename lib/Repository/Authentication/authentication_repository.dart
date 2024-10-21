// ignore_for_file: empty_catches, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kwye/Repository/Authentication/exception/firebaseAuth_exceptions.dart';
import 'package:kwye/Screens/choices.dart';
import 'package:kwye/Screens/getting_started.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    //setInitialScreen(firebaseUser.value);
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const GettingStarted())
        : Get.offAll(() => const ChoicesScreen());
  }

  /* ------------ Email & Password SignIn ----------------*/

  Future<void> createUserWithEmailandPassword(
      String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    firebaseUser.value != null
        ? Get.offAll(() => const ChoicesScreen())
        : Get.offAll(() => const GettingStarted());
  }

  Future<void> loginUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> sendEmailVerification() async {
    await _auth.currentUser?.sendEmailVerification();
  }

  Future<void> logout() async => await _auth.signOut();

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
