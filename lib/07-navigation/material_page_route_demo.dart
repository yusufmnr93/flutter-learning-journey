import 'package:flutter/material.dart';

class MaterialPageRouteDemo extends StatelessWidget {
  const MaterialPageRouteDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan 1 - MaterialPageRoute')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ini adalah halaman Home',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TujuanMaterialPage(),
                  ),
                );
              },
              child: const Text('Ke Halaman Tujuan'),
            ),
          ],
        ),
      ),
    );
  }
}

class TujuanMaterialPage extends StatelessWidget {
  const TujuanMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Tujuan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ini adalah halaman Tujuan',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali ke Home'),
            ),
          ],
        ),
      ),
    );
  }
}
