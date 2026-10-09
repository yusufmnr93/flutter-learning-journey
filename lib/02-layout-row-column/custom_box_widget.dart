import 'package:flutter/material.dart';

class CustomBoxWidget extends StatelessWidget {
  const CustomBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.thumb_up, color: Colors.yellow, size: 36),
    );
  }
}
