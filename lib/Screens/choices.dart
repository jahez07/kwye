// ignore_for_file: non_constant_identifier_names, unused_element

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kwye/Repository/Authentication/authentication_repository.dart';
import 'package:kwye/utils/custom_button.dart';
import 'package:http/http.dart' as http;

class ChoicesScreen extends StatefulWidget {
  const ChoicesScreen({super.key});

  @override
  State<ChoicesScreen> createState() => _ChoicesScreenState();
}

class _ChoicesScreenState extends State<ChoicesScreen> {
  File? _imageFile;
  String _extractedText = '';
  late var apiData = "";

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _processImage();
    }
  }

  Future<void> _processImage() async {
    final input_Image = InputImage.fromFilePath(_imageFile!.path);
    final text_Recognizer = TextRecognizer();
    final RecognizedText recognizedText =
        await text_Recognizer.processImage(input_Image);
    setState(() {
      _extractedText = recognizedText.text;
    });
  }

  Future<void> backendApiCall() async {
    final backendUrl = Uri.parse('http://127.0.0.1:8000/');
    try {
      final responseData = await http.get(backendUrl);

      if (responseData.statusCode == 200) {
        final apiResponse = json.decode(responseData.body);
        setState(() {
          apiData = apiResponse.toString();
        });
      }
    } catch (execption) {}
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Choices',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Scan Barcode',
                    onTap: _pickImage,
                    width: size.width * 0.4,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    text: 'Cooked',
                    onTap: () {
                      backendApiCall();
                    },
                    width: size.width * 0.3,
                    fontSize: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            // A P I  D A T A
            Container(
              width: size.width * 0.7,
              height: size.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(width: 1, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Center(child: Text(apiData)),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),

            // O C R  O U T P U T
            Container(
              width: size.width * 0.7,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(width: 1, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Center(child: Text(_extractedText)),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            TextButton(
                onPressed: () {
                  AuthenticationRepository.instance.logout();
                },
                child: const Text(
                  'SignOut',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
