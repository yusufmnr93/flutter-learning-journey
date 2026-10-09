import 'package:flutter/material.dart';

class SpacerDemo extends StatelessWidget {
  const SpacerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan 2 - Spacer')),
      body: Center(
        child: Row(
          children: [
            _kotakUji(Colors.amber, 'Amber'),

            // flex: 1 = satu bagian ruang.
            const Spacer(flex: 1),

            SizedBox(
              width: 100,
              height: 100,
              child: _kotakUji(Colors.green, 'Green'),
            ),

            // flex: 2 = dua bagian ruang.
            // Jadi jaraknya secara proporsional
            // lebih besar daripada Spacer(flex: 1).
            const Spacer(flex: 2),

            _kotakUji(Colors.blue, 'Blue'),
          ],
        ),
      ),
    );
  }

  Widget _kotakUji(Color warna, String teks) {
    return Container(
      width: 75,
      height: 75,
      color: warna,
      alignment: Alignment.center,
      child: Text(
        teks,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
