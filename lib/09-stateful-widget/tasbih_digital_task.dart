import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class TasbihDigitalTask extends StatefulWidget {
  const TasbihDigitalTask({super.key});

  @override
  State<TasbihDigitalTask> createState() => _TasbihDigitalTaskState();
}

class _TasbihDigitalTaskState extends State<TasbihDigitalTask> {
  late final ValueNotifier<double> _valueNotifier;
  double counter = 0.0;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier<double>(0.0);
  }

  void incrementCounter() {
    if (counter < 33) {
      setState(() {
        counter++;
        _valueNotifier.value = (counter / 33) * 100;
      });
    }
  }

  void resetCounter() {
    setState(() {
      counter = 0.0;
      _valueNotifier.value = 0.0;
    });
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbih Digital'),
        backgroundColor: const Color.fromARGB(255, 119, 210, 145),
      ),
      backgroundColor: const Color.fromARGB(255, 119, 210, 145),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${counter.round()} / 33',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SimpleCircularProgressBar(
                size: 300,
                progressStrokeWidth: 20,
                backStrokeWidth: 10,
                mergeMode: true,
                maxValue: 100,
                animationDuration: 0,
                progressColors: [Colors.amberAccent.shade400],
                valueNotifier: _valueNotifier,
                onGetText: (value) {
                  return Text(
                    '${(value / 100 * 33).round()}',
                    style: const TextStyle(fontSize: 80),
                  );
                },
              ),
              const SizedBox(height: 40),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: incrementCounter,
                    child: const SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(Icons.fingerprint, size: 80),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ketuk untuk menghitung tasbih',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resetCounter,
        tooltip: 'Reset hitungan',
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
