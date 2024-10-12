import 'package:flutter/material.dart';

class ChoicesScreen extends StatelessWidget {
  const ChoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.grey.shade300),
            ),
            child: const Text('Barcode Scanner'),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(),
        ],
      ),
    );
  }
}
