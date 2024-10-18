// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwye/Authentication/loginScreen.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.3, 0.5, 1.0],
            colors: [
              Colors.grey.shade800, // Slightly darker purple at the bottom
              Colors.grey.shade400, // Light purple starts before halfway
              Colors.grey.shade50, // Very light blue
              Colors.white, // Start with white at the top
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Knowing\n',
                          style: GoogleFonts.poppins(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            height: 1.1,
                          ),
                        ),
                        WidgetSpan(
                            child: SizedBox(
                          height: size.height * 0,
                        )),
                        TextSpan(
                          text: 'What You \nAre Eating',
                          style: GoogleFonts.poppins(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade400,
                            height: 1.1,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Lorem ipsum odor amet, consectetuer adipiscing elit. Tempus tortor dictum euismod',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.grey.shade500),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => const LoginScreen()),
                      child: Container(
                        height: 60,
                        width: size.width * 1,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
