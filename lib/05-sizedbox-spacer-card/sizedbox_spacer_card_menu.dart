import 'package:flutter/material.dart';

import 'sizedbox_demo.dart';
import 'spacer_demo.dart';
import 'card_demo.dart';
import 'music_card_task.dart';

class SizedboxSpacerCardMenu extends StatelessWidget {
  const SizedboxSpacerCardMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('05 - SizedBox, Spacer & Card')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(
            context,
            icon: Icons.crop_square_rounded,
            title: 'Percobaan 1: SizedBox',
            subtitle: 'Mengatur ukuran dan jarak tetap',
            screen: const SizedboxDemo(),
          ),

          _buildMenuCard(
            context,
            icon: Icons.space_bar_rounded,
            title: 'Percobaan 2: Spacer',
            subtitle: 'Mengatur jarak secara proporsional',
            screen: const SpacerDemo(),
          ),

          _buildMenuCard(
            context,
            icon: Icons.credit_card_rounded,
            title: 'Percobaan 3: Card',
            subtitle: 'Membuat kartu informasi dengan tombol',
            screen: const CardDemo(),
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
                'Tugas Praktikum: Music Card',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Card, SizedBox, Spacer, dan tombol Like'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MusicCardTask(),
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
