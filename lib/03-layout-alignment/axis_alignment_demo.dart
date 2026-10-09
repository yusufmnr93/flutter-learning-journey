import 'package:flutter/material.dart';

class AxisAlignmentDemo extends StatelessWidget {
  const AxisAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan 3 - Axis & Baseline')),
      body: Center(
        child: Row(
          // Mengatur distribusi secara horizontal.
          //
          // Bisa diganti:
          // start
          // end
          // center
          // spaceBetween
          // spaceAround
          // spaceEvenly
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          // Baseline membuat teks berbeda ukuran
          // berada pada garis dasar yang sama.
          crossAxisAlignment: CrossAxisAlignment.baseline,

          // Wajib ketika menggunakan CrossAxisAlignment.baseline.
          textBaseline: TextBaseline.alphabetic,

          children: const [
            Text('Suhu:', style: TextStyle(fontSize: 30)),
            Text('25°C', style: TextStyle(fontSize: 75)),
            Icon(Icons.sunny, color: Colors.amber, size: 45),
          ],
        ),
      ),
    );
  }
}
