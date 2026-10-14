import 'package:flutter/material.dart';

import 'counter_app_demo.dart';
import 'like_button_demo.dart';
import 'tasbih_digital_task.dart';

class StatefulWidgetMenu extends StatelessWidget {
  const StatefulWidgetMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('09 - StatefulWidget')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(
            context,
            icon: Icons.exposure_plus_1_rounded,
            title: 'Percobaan 1: Counter App',
            subtitle: 'Mengubah angka dengan setState()',
            screen: const CounterAppDemo(),
          ),
          _buildMenuCard(
            context,
            icon: Icons.favorite_rounded,
            title: 'Percobaan 2: Like Button',
            subtitle: 'Mengubah status dan jumlah like',
            screen: const LikeButtonDemo(),
          ),
          const SizedBox(height: 8),
          Card(
            color: Colors.green.shade50,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(
                Icons.fingerprint_rounded,
                color: Colors.green,
                size: 32,
              ),
              title: const Text(
                'Tugas Praktikum: Tasbih Digital',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Hitungan tasbih dengan circular progress dan reset',
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TasbihDigitalTask(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget screen,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.teal.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.teal),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}
