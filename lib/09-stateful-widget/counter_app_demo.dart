import 'package:flutter/material.dart';

class CounterAppDemo extends StatefulWidget {
  const CounterAppDemo({super.key});

  @override
  State<CounterAppDemo> createState() => _CounterAppDemoState();
}

class _CounterAppDemoState extends State<CounterAppDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Klik tombol tambah atau kurang:',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(100, 60),
                  ),
                  onPressed: _decrementCounter,
                  child: const Text('Kurang', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(100, 60),
                  ),
                  onPressed: _incrementCounter,
                  child: const Text('Tambah', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
