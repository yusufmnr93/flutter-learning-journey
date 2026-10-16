import 'package:flutter/material.dart';

import 'dashboard/dashboard_screen.dart';
import '10-game-store/view/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
      routes: {
        '/detail': (context) {
          final gameId = ModalRoute.of(context)!.settings.arguments as int;

          return Detail(gameTerpilih: gameId);
        },
      },
    );
  }
}
