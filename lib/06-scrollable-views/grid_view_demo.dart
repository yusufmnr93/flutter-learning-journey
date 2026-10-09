import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan 1 - GridView')),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: [
          _tile(Colors.blueAccent, Icons.person, 'Kehadiran'),
          _tile(Colors.greenAccent.shade400, Icons.schedule, 'Jadwal Kuliah'),
          _tile(Colors.yellowAccent.shade400, Icons.assignment, 'Tugas'),
          _tile(Colors.redAccent.shade400, Icons.notifications, 'Pengumuman'),
          _tile(Colors.purpleAccent.shade400, Icons.grade, 'Nilai'),
          _tile(Colors.tealAccent.shade400, Icons.edit_note, 'Catatan'),
        ],
      ),
    );
  }

  Widget _tile(Color color, IconData icon, String title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: color,
        child: GridTile(
          footer: SizedBox(
            height: 45,
            child: GridTileBar(
              backgroundColor: Colors.black38,
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          child: Icon(icon, size: 70, color: Colors.white),
        ),
      ),
    );
  }
}
