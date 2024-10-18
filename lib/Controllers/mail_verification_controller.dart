// ignore_for_file: unused_field

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kwye/Repository/Authentication/authentication_repository.dart';

class MailVerificationController extends GetxController {
  late Timer _timer;
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerForAutoRedirect();
  }

  Future<void> sendEmailVerification() async {
    await AuthenticationRepository.instance.sendEmailVerification();
  }

  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        timer.cancel();
        AuthenticationRepository.instance.setInitialScreen(user);
      }
    });
  }

  void manuallyCheckEmailVerificationStatus() {}
}
