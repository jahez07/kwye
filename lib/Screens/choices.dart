import 'package:flutter/material.dart';

class ChoicesScreen extends StatelessWidget {
  const ChoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
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
      ),
    );
  }
}
