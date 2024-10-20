import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kwye/Repository/Authentication/authentication_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Textfield controllers to get text from TextFileds
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  // Call this function from the design to do the rest
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailandPassword(email, password);
  }

  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .loginUserWithEmailandPassword(email, password);
  }
}
