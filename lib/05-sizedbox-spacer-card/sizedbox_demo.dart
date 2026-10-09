import 'package:flutter/material.dart';

class SizedboxDemo extends StatelessWidget {
  const SizedboxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan 1 - SizedBox')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _kotakUji(Colors.amber),

            // SizedBox kosong digunakan untuk memberikan
            // jarak tetap sebesar 25 pixel.
            const SizedBox(width: 25),

            // SizedBox juga bisa digunakan untuk
            // menentukan ukuran widget.
            const SizedBox(width: 100, height: 100, child: _GreenBox()),

            const SizedBox(width: 25),

            _kotakUji(Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _kotakUji(Color warna) {
    return Container(width: 75, height: 75, color: warna);
  }
}

class _GreenBox extends StatelessWidget {
  const _GreenBox();

  @override
  Widget build(BuildContext context) {
    return Container(width: 75, height: 75, color: Colors.green);
  }
}
