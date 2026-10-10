import 'package:flutter/material.dart';

import 'grid_view_demo.dart';
import 'list_view_demo.dart';
import 'grid_view_builder_demo.dart';
import 'list_view_builder_demo.dart';
import 'game_list_task.dart';

class ScrollableViewsMenu extends StatelessWidget {
  const ScrollableViewsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('06 - Scrollable Views')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(
            context,
            icon: Icons.grid_view_rounded,
            title: 'Percobaan 1: GridView',
            subtitle: 'Menampilkan item dalam bentuk grid',
            screen: const GridViewDemo(),
          ),
          _buildMenuCard(
            context,
            icon: Icons.view_list_rounded,
            title: 'Percobaan 2: ListView',
            subtitle: 'Menampilkan item dalam bentuk daftar',
            screen: const ListViewDemo(),
          ),
          _buildMenuCard(
            context,
            icon: Icons.grid_on_rounded,
            title: 'Percobaan 3: GridView.builder',
            subtitle: 'Menampilkan data dinamis dari API',
            screen: const GridViewBuilderDemo(),
          ),
          _buildMenuCard(
            context,
            icon: Icons.list_alt_rounded,
            title: 'Percobaan 4: ListView.builder',
            subtitle: 'Menampilkan data API dalam bentuk list',
            screen: const ListViewBuilderDemo(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(),
          ),
          Card(
            color: Colors.indigo.shade50,
            child: ListTile(
              leading: Icon(Icons.games_rounded, color: Colors.indigo),
              title: const Text(
                'Tugas Praktikum: Game List',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Daftar game dari API FreeToGame'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameListTask()),
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
