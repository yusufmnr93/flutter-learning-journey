import 'package:flutter/material.dart';

import 'game_api_home.dart';
import 'named_route_arguments_demo.dart';

class NavigationArgumentsMenu extends StatelessWidget {
  const NavigationArgumentsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('08 - Navigation Arguments')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(
            context,
            icon: Icons.route_rounded,
            title: 'Percobaan Utama: Named Route + Arguments',
            subtitle: 'Mengirim data dari Home ke halaman Tujuan',
            screen: const NamedRouteArgumentsDemo(),
          ),
          const SizedBox(height: 8),
          Card(
            color: Colors.deepOrange.shade50,
            child: ListTile(
              leading: const Icon(
                Icons.videogame_asset_rounded,
                color: Colors.deepOrange,
              ),
              title: const Text(
                'Tugas Praktikum: Informasi Game',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Mengambil data dari API FreeToGame dan menampilkan detail',
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameApiHome()),
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
            color: Colors.indigo.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.indigo),
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
