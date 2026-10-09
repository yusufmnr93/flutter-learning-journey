import 'package:flutter/material.dart';

import '../02-layout-row-column/row_column_menu.dart';
import '../03-layout-alignment/alignment_menu.dart';
import '../04-flexible-expanded/flexible_expanded_menu.dart';
import '../05-sizedbox-spacer-card/sizedbox_spacer_card_menu.dart';
import '../06-scrollable-views/scrollable_views_menu.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul Praktikum Flutter'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTopicCard(
            context: context,
            topicNumber: '02',
            title: 'Layout Row & Column',
            subtitle: 'Pengaturan elemen horizontal, vertikal, & Grid 2x2',
            icon: Icons.grid_view_rounded,
            color: Colors.blue,
            targetScreen: const RowColumnMenu(),
          ),

          const SizedBox(height: 12),

          _buildTopicCard(
            context: context,
            topicNumber: '03',
            title: 'Layout Alignment',
            subtitle: 'MainAxis, CrossAxis, Row, Column, dan Baseline',
            icon: Icons.align_horizontal_center_rounded,
            color: Colors.orange,
            targetScreen: const AlignmentMenu(),
          ),

          const SizedBox(height: 12),

          _buildTopicCard(
            context: context,
            topicNumber: '04',
            title: 'Flexible & Expanded',
            subtitle: 'Pengaturan ruang menggunakan flex dan fit',
            icon: Icons.view_week_rounded,
            color: Colors.green,
            targetScreen: const FlexibleExpandedMenu(),
          ),

          const SizedBox(height: 12),

          _buildTopicCard(
            context: context,
            topicNumber: '05',
            title: 'SizedBox, Spacer & Card',
            subtitle: 'Ukuran, jarak proporsional, dan kartu informasi',
            icon: Icons.credit_card_rounded,
            color: Colors.purple,
            targetScreen: const SizedboxSpacerCardMenu(),
          ),

          const SizedBox(height: 12),

          _buildTopicCard(
            context: context,
            topicNumber: '06',
            title: 'Scrollable Views',
            subtitle: 'GridView, ListView, dan Builder',
            icon: Icons.view_module_rounded,
            color: Colors.indigo,
            targetScreen: const ScrollableViewsMenu(),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicCard({
    required BuildContext context,
    required String topicNumber,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget targetScreen,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 26),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TOPIK $topicNumber',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: color,
                        letterSpacing: 1.1,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400),
            ],
          ),
        ),
      ),
    );
  }
}
