import 'package:flutter/material.dart';

class WeatherLayoutTask extends StatelessWidget {
  const WeatherLayoutTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alignment')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          // Bisa diganti:
          // CrossAxisAlignment.start
          // CrossAxisAlignment.end
          // CrossAxisAlignment.center
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const Text('Malang', style: TextStyle(fontSize: 20)),

            const SizedBox(height: 18),

            const Text(
              '25°',
              style: TextStyle(fontSize: 58, fontWeight: FontWeight.w300),
            ),

            const SizedBox(height: 35),

            Row(
              // Bisa diganti:
              // start, end, center,
              // spaceBetween, spaceAround, spaceEvenly
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _WeatherItem(hari: 'Minggu', icon: Icons.sunny, suhu: '20°C'),
                _WeatherItem(
                  hari: 'Senin',
                  icon: Icons.cloudy_snowing,
                  suhu: '23°C',
                ),
                _WeatherItem(hari: 'Selasa', icon: Icons.cloud, suhu: '22°C'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherItem extends StatelessWidget {
  final String hari;
  final IconData icon;
  final String suhu;

  const _WeatherItem({
    required this.hari,
    required this.icon,
    required this.suhu,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(hari, style: const TextStyle(fontSize: 10)),

        const SizedBox(height: 8),

        Icon(icon, size: 28, color: Colors.black),

        const SizedBox(height: 5),

        Text(suhu, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}
