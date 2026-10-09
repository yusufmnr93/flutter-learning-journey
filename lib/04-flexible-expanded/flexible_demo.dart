import 'package:flutter/material.dart';

class FlexibleDemo extends StatelessWidget {
  const FlexibleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan 1 - Flexible')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Flexible - FlexFit.loose',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: _box(Colors.blue, '1'),
                  ),

                  Flexible(
                    flex: 3,
                    fit: FlexFit.loose,
                    child: _box(Colors.green, '3'),
                  ),

                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: _box(Colors.orange, '2'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Flexible - FlexFit.tight',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                    // flex menentukan perbandingan ruang.
                    // Misalnya 1 : 3 : 2
                    flex: 1,

                    // tight = anak mengisi ruang sesuai flex.
                    fit: FlexFit.tight,

                    child: _box(Colors.blue, '1'),
                  ),

                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: _box(Colors.green, '3'),
                  ),

                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: _box(Colors.orange, '2'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Kombinasi Tight & Loose',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: _box(Colors.blue, 'Tight'),
                  ),

                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: _box(Colors.green, 'Tight'),
                  ),

                  Flexible(
                    flex: 2,

                    // Bisa diganti FlexFit.tight
                    // untuk melihat perbedaannya.
                    fit: FlexFit.loose,

                    child: _box(Colors.orange, 'Loose'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _box(Color color, String text) {
    return Container(
      width: double.infinity,
      height: 75,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
