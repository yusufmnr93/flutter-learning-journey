import 'package:flutter/material.dart';

import 'row_alignment_demo.dart';
import 'column_alignment_demo.dart';
import 'axis_alignment_demo.dart';
import 'weather_layout_task.dart';

class AlignmentMenu extends StatelessWidget {
  const AlignmentMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('03 - Layout Alignment')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(
            context,
            icon: Icons.view_week_rounded,
            title: 'Percobaan 1: Row Alignment',
            subtitle: 'MainAxisSize, MainAxisAlignment, dan CrossAxisAlignment',
            screen: const RowAlignmentDemo(),
          ),

          _buildMenuCard(
            context,
            icon: Icons.view_stream_rounded,
            title: 'Percobaan 2: Column Alignment',
            subtitle: 'Pengaturan alignment pada Column',
            screen: const ColumnAlignmentDemo(),
          ),

          _buildMenuCard(
            context,
            icon: Icons.align_vertical_center_rounded,
            title: 'Percobaan 3: Axis & Baseline',
            subtitle: 'CrossAxisAlignment dan TextBaseline',
            screen: const AxisAlignmentDemo(),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(),
          ),

          Card(
            color: Colors.indigo.shade50,
            child: ListTile(
              leading: const Icon(Icons.wb_sunny_rounded, color: Colors.orange),
              title: const Text(
                'Tugas Praktikum: Weather UI',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('UI cuaca menggunakan Row dan Column'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeatherLayoutTask(),
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
            color: Colors.indigo.withOpacity(0.1),
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
