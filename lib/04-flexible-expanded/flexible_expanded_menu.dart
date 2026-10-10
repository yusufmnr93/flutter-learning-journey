import 'package:flutter/material.dart';

import 'flexible_demo.dart';
import 'expanded_demo.dart';
import 'music_control_bar_task.dart';

class FlexibleExpandedMenu extends StatelessWidget {
  const FlexibleExpandedMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('04 - Flexible & Expanded')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(
            context,
            icon: Icons.view_week_rounded,
            title: 'Percobaan 1: Flexible',
            subtitle: 'Mempelajari flex dan FlexFit',
            screen: const FlexibleDemo(),
          ),

          _buildMenuCard(
            context,
            icon: Icons.expand_rounded,
            title: 'Percobaan 2: Expanded',
            subtitle: 'Membandingkan ruang normal, Flexible, dan Expanded',
            screen: const ExpandedDemo(),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(),
          ),

          Card(
            color: Colors.indigo.shade50,
            child: ListTile(
              leading: const Icon(
                Icons.music_note_rounded,
                color: Colors.indigo,
              ),
              title: const Text(
                'Tugas Praktikum: Music Control Bar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Row, Expanded, dan Flexible'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MusicControlBarTask(),
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
