// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: size.height, // Set the container height to full screen height
          padding: EdgeInsets.all(20),
          child: Center(
            // Wrap the Column with Center
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'KWYE',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                Text(
                  'know what you eat',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
                SizedBox(height: size.height * 0.08),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    children: [
                      TextFormField(
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
                      SizedBox(height: size.height * 0.05),

                      // LOGIN BUTTON
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: GoogleFonts.poppins(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
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
