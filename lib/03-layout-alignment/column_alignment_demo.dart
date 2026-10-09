import 'package:flutter/material.dart';

class ColumnAlignmentDemo extends StatelessWidget {
  const ColumnAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan 2 - Column Alignment')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'MainAxisAlignment pada Column',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Container(
              height: 450,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Column(
                // Bisa diganti:
                // MainAxisAlignment.start
                // MainAxisAlignment.end
                // MainAxisAlignment.center
                // MainAxisAlignment.spaceBetween
                // MainAxisAlignment.spaceAround
                // MainAxisAlignment.spaceEvenly
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                // Pada Column, cross axis adalah horizontal.
                // Bisa diganti:
                // CrossAxisAlignment.start
                // CrossAxisAlignment.end
                // CrossAxisAlignment.center
                // CrossAxisAlignment.stretch
                crossAxisAlignment: CrossAxisAlignment.center,

                children: const [KotakKecil(), KotakSedang(), KotakKecil()],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'MainAxisSize',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(16),
              child: Column(
                // max = mengambil seluruh ruang vertikal
                // min = hanya mengambil ruang yang dibutuhkan
                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  KotakKecil(),
                  SizedBox(height: 15),
                  KotakSedang(),
                  SizedBox(height: 15),
                  KotakKecil(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KotakKecil extends StatelessWidget {
  const KotakKecil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: const Icon(Icons.thumb_up, color: Colors.white),
    );
  }
}

class KotakSedang extends StatelessWidget {
  const KotakSedang({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: const Icon(Icons.thumb_up, color: Colors.white, size: 40),
    );
  }
}
