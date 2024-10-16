// ignore_for_file: non_constant_identifier_names, unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kwye/Repository/Authentication/authentication_repository.dart';

class ChoicesScreen extends StatefulWidget {
  const ChoicesScreen({super.key});

  @override
  State<ChoicesScreen> createState() => _ChoicesScreenState();
}

class _ChoicesScreenState extends State<ChoicesScreen> {
  File? _imageFile;
  String _extractedText = '';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                    ),
                    child: const Text(
                      'Packed Food',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                    ),
                    child: const Text(
                      'Cooked Food',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
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
                child: Text(_extractedText),
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
