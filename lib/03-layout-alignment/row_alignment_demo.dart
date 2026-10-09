import 'package:flutter/material.dart';

class RowAlignmentDemo extends StatelessWidget {
  const RowAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan 1 - Row Alignment')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MainAxisSize.max',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              height: 120,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Row(
                mainAxisSize: MainAxisSize.max,

                // Bisa diganti:
                // MainAxisAlignment.start
                // MainAxisAlignment.end
                // MainAxisAlignment.center
                // MainAxisAlignment.spaceBetween
                // MainAxisAlignment.spaceAround
                // MainAxisAlignment.spaceEvenly
                mainAxisAlignment: MainAxisAlignment.center,

                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  KotakBiruJempolKecil(),
                  SizedBox(width: 20),
                  KotakBiruJempol(),
                  SizedBox(width: 20),
                  KotakBiruJempolKecil(),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'MainAxisSize.min',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              height: 120,
              color: Colors.grey.shade200,
              child: Row(
                // max = mengambil seluruh ruang horizontal
                // min = hanya mengambil ruang yang dibutuhkan anak
                mainAxisSize: MainAxisSize.min,

                // Coba ganti dengan:
                // start, end, center,
                // spaceBetween, spaceAround, spaceEvenly
                mainAxisAlignment: MainAxisAlignment.center,

                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  KotakBiruJempolKecil(),
                  SizedBox(width: 20),
                  KotakBiruJempol(),
                  SizedBox(width: 20),
                  KotakBiruJempolKecil(),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'CrossAxisAlignment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                // Bisa diganti:
                // CrossAxisAlignment.start
                // CrossAxisAlignment.end
                // CrossAxisAlignment.center
                // CrossAxisAlignment.stretch
                crossAxisAlignment: CrossAxisAlignment.center,

                children: const [
                  _KotakVariasi(height: 60, color: Colors.blue),
                  _KotakVariasi(height: 100, color: Colors.green),
                  _KotakVariasi(height: 140, color: Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KotakBiruJempol extends StatelessWidget {
  const KotakBiruJempol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.thumb_up, color: Colors.white, size: 40),
    );
  }
}

class KotakBiruJempolKecil extends StatelessWidget {
  const KotakBiruJempolKecil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.thumb_up, color: Colors.white, size: 40),
    );
  }
}

class _KotakVariasi extends StatelessWidget {
  final double height;
  final Color color;

  const _KotakVariasi({required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: height,
      color: color,
      child: const Icon(Icons.thumb_up, color: Colors.white),
    );
  }
}
