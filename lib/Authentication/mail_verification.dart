// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwye/Constants/text_strings.dart';
import 'package:kwye/Controllers/mail_verification_controller.dart';
import 'package:kwye/Repository/Authentication/authentication_repository.dart';
import 'package:kwye/utils/custom_button.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 30 * 5, left: 30, right: 30, bottom: 30 * 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                LineAwesomeIcons.envelope_open,
                size: 100,
              ),
              const SizedBox(
                height: 30 * 2,
              ),
              Text(
                'Verify your email address'.tr,
                style: GoogleFonts.poppins(
                    fontSize: 23, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),
              Text(
                emailVerification.tr,
                style: GoogleFonts.poppins(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30 * 1.5,
              ),
              CustomButton(
                text: 'Continue',
                onTap: () => controller.manuallyCheckEmailVerificationStatus(),
                width: 150,
                fontSize: 20,
              ),
              SizedBox(
                height: 30 * 2.2,
              ),
              TextButton(
                onPressed: () => controller.sendEmailVerification,
                child: Text(
                  'Resend E-Mail Link',
                  style: GoogleFonts.poppins(
                      fontSize: 15, color: Colors.blue.shade800),
                ),
              ),
              TextButton(
                  onPressed: () => AuthenticationRepository.instance.logout(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'back to login',
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.blue.shade800),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
