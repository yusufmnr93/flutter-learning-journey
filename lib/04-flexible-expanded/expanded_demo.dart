import 'package:flutter/material.dart';

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan 2 - Expanded')),
      body: Column(
        children: [
          _kotakUji(Colors.amber, 150, 'Normal'),

          Flexible(
            // Expanded sebenarnya adalah Flexible
            // dengan FlexFit.tight secara default.
            flex: 1,
            fit: FlexFit.tight,
            child: _kotakUji(Colors.green, 100, 'Flexible'),
          ),

          Expanded(
            // Bisa diganti:
            // flex: 1
            // flex: 2
            // flex: 3
            //
            // Semakin besar flex,
            // semakin besar bagian ruang yang didapat.
            flex: 2,
            child: _kotakUji(Colors.blue, 250, 'Expanded'),
          ),
        ],
      ),
    );
  }

  Widget _kotakUji(Color warna, double tinggi, String teks) {
    return Container(
      width: double.infinity,
      height: tinggi,
      color: warna,
      alignment: Alignment.center,
      child: Text(
        teks,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
