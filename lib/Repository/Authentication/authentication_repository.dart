// ignore_for_file: empty_catches, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kwye/Authentication/mail_verification.dart';
import 'package:kwye/Repository/Authentication/exception/signup_email_password_failure.dart';
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
    setInitialScreen(firebaseUser.value);
    //ever(firebaseUser, _setInitialScreen);
  }

  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const GettingStarted())
        : user.emailVerified
            ? Get.offAll(() => const ChoicesScreen())
            : Get.offAll(() => const MailVerification());
  }

  Future<void> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const GettingStarted())
          : Get.offAll(() => const ChoicesScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupEmailPasswordFailure.code(e.code);
      //print('FIREBASE AUTH EXCEPTION -  ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignupEmailPasswordFailure();
      //print('EXCEPTION - ${ex.message}');
      throw ex;
    }
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
}
