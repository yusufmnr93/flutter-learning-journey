import 'package:flutter/material.dart';

class ContainerBoxView extends StatelessWidget {
  const ContainerBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Single Container Box')),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.thumb_up, color: Colors.yellow, size: 40),
        ),
      ),
    );
  }
}
