import 'package:flutter/material.dart';

class NavigationTask extends StatelessWidget {
  const NavigationTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const NavigationTaskHome(),
            );
          case '/tujuan':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const NavigationTaskTujuan(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(child: Text('Halaman tidak ditemukan')),
              ),
            );
        }
      },
    );
  }
}

class NavigationTaskHome extends StatelessWidget {
  const NavigationTaskHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tugas Praktikum - Halaman Utama')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Aplikasi Navigasi Flutter',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Selamat datang di Halaman Utama'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tujuan');
              },
              child: const Text('Ke Halaman Tujuan'),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationTaskTujuan extends StatelessWidget {
  const NavigationTaskTujuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Tujuan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ini adalah Halaman Tujuan',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text('Kamu berhasil berpindah halaman.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali ke Halaman Utama'),
            ),
          ],
        ),
      ),
    );
  }
}
