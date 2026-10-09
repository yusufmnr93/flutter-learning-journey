import 'package:flutter/material.dart';

import 'single_box_view.dart';
import 'row_layout_view.dart';
import 'column_layout_view.dart';
import 'grid_layout_task.dart';

class RowColumnMenu extends StatelessWidget {
  const RowColumnMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('02 - Layout Row & Column')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.looks_one, color: Colors.blue),
              title: const Text('Langkah 2-3: Single Custom Box'),
              subtitle: const Text('Menampilkan 1 KotakBiruJempol'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SingleBoxView(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.looks_two, color: Colors.blue),
              title: const Text('Langkah 4: Layout Row'),
              subtitle: const Text('Menyusun 3 kotak secara horizontal'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RowLayoutView(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.looks_3, color: Colors.blue),
              title: const Text('Langkah 5: Layout Column'),
              subtitle: const Text('Menyusun 3 kotak secara vertikal'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ColumnLayoutView(),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 24, thickness: 1),
          Card(
            color: Colors.blue.shade50,
            child: ListTile(
              leading: const Icon(Icons.assignment, color: Colors.blue),
              title: const Text(
                'Tugas Praktikum: Grid 2x2',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Grid 2x2 dengan 4 warna & icon favorit'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GridLayoutTaskScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
