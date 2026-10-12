import 'package:flutter/material.dart';

import 'screen_arguments_demo.dart';

class NamedRouteArgumentsDemo extends StatelessWidget {
  const NamedRouteArgumentsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const NamedArgumentsHome(),
        NamedArgumentsTujuan.routeName: (context) =>
            const NamedArgumentsTujuan(),
      },
    );
  }
}

class NamedArgumentsHome extends StatelessWidget {
  const NamedArgumentsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Ini halaman Home', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                const args = ScreenArgumentsDemo(
                  'Judul Game',
                  'Genre: Action',
                  'Ini adalah deskripsi singkat dari game.',
                );

                Navigator.pushNamed(
                  context,
                  NamedArgumentsTujuan.routeName,
                  arguments: args,
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

class NamedArgumentsTujuan extends StatelessWidget {
  const NamedArgumentsTujuan({super.key});

  static const routeName = '/tujuan';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsDemo;

    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Tujuan')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                args.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                args.subtitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                args.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali ke Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
