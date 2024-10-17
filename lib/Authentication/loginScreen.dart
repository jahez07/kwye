// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwye/Authentication/signup_screen.dart';
import 'package:kwye/Controllers/signup_controller.dart';
import 'package:kwye/Screens/choices.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;
    final controller = Get.put(SignupController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: size.height, // Set the container height to full screen height
          padding: EdgeInsets.all(20),
          child: Center(
            // Wrap the Column with Center
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'KWYE',
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'know what you eat',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Email',
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.8),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          controller: controller.password,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            labelText: 'Password',
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.8),
                            ),
                            suffixIcon: IconButton(
                              onPressed: null,
                              icon: Icon(Icons.remove_red_eye_outlined),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),

                        // LOGIN BUTTON
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              SignupController.instance.loginUser(
                                  controller.email.text.trim(),
                                  controller.password.text.trim());
                              Scaffold(
                                body: SnackBar(
                                  content: Text('Login Successful'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            child: Center(
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextButton(
                          onPressed: () => Get.to(() => SignupScreen()),
                          child: Text.rich(
                            TextSpan(
                                text: 'Don\'t have an account?',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: ' Sign Up',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blue))
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
