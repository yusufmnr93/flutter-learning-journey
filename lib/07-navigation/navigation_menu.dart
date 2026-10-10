import 'package:flutter/material.dart';

import 'material_page_route_demo.dart';
import 'named_route_demo.dart';
import 'navigation_task.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('07 - Navigation')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(
            context,
            icon: Icons.open_in_new_rounded,
            title: 'Percobaan 1: MaterialPageRoute',
            subtitle: 'Navigasi langsung antarhalaman',
            screen: const MaterialPageRouteDemo(),
          ),
          _buildMenuCard(
            context,
            icon: Icons.route_rounded,
            title: 'Percobaan 2: Named Route',
            subtitle: 'Navigasi menggunakan nama route',
            screen: const NamedRouteDemo(),
          ),
          const SizedBox(height: 8),
          Card(
            color: Colors.indigo.shade50,
            child: ListTile(
              leading: const Icon(
                Icons.assignment_rounded,
                color: Colors.indigo,
              ),
              title: const Text(
                'Tugas Praktikum: Navigasi Dua Halaman',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Halaman Utama dan Halaman Tujuan'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationTask(),
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
