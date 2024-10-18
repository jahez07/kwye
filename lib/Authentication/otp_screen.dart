// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CO\nDE',
                  style: GoogleFonts.montserrat(
                      fontSize: 80.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Verification'.toUpperCase(),
                  style: GoogleFonts.montserrat(
                      fontSize: 15.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Enter the verification code sent to jahez.john@gmail.com",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  cursorColor: Colors.yellow,
                  borderColor: Colors.black,
                  focusedBorderColor: Colors.green,
                  showFieldAsBox: true,
                  onSubmit: (code) {
                    //print('OTP is $code');
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide(color: Colors.black),
                      minimumSize:
                          Size(double.maxFinite, 50), // Increase height to 50
                    ),
                    child: Text(
                      'NEXT',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
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
