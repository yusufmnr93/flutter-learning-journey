import 'package:flutter/material.dart';

class NamedRouteDemo extends StatelessWidget {
  const NamedRouteDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const NamedRouteHome(),
        '/tujuan': (context) => const NamedRouteTujuan(),
      },
    );
  }
}

class NamedRouteHome extends StatelessWidget {
  const NamedRouteHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ini Halaman Home', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 15),
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

class NamedRouteTujuan extends StatelessWidget {
  const NamedRouteTujuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Tujuan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ini Halaman Tujuan', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 15),
            ElevatedButton(
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
