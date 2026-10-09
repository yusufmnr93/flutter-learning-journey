import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan 2 - ListView')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _listTile(
            Colors.blueAccent.shade100,
            Colors.greenAccent.shade400,
            Icons.person,
            'Kehadiran',
            'Presensi kehadiran kuliah',
          ),
          _listTile(
            Colors.greenAccent.shade100,
            Colors.blueAccent.shade400,
            Icons.schedule,
            'Jadwal',
            'Jadwal perkuliahan',
          ),
          _listTile(
            Colors.yellowAccent.shade100,
            Colors.redAccent.shade400,
            Icons.assignment,
            'Tugas',
            'Tugas perkuliahan di luar kelas',
          ),
          _listTile(
            Colors.redAccent.shade100,
            Colors.amberAccent.shade400,
            Icons.notifications,
            'Pengumuman',
            'Informasi terkait perkuliahan',
          ),
          _listTile(
            Colors.purpleAccent.shade100,
            Colors.tealAccent.shade400,
            Icons.grade,
            'Nilai',
            'Nilai ujian dan tugas',
          ),
          _listTile(
            Colors.tealAccent.shade100,
            Colors.purpleAccent.shade400,
            Icons.edit_note,
            'Catatan',
            'Pengingat kegiatan perkuliahan',
          ),
        ],
      ),
    );
  }

  Widget _listTile(
    Color color,
    Color avatarColor,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        tileColor: color,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 16)),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: avatarColor,
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        trailing: Icon(Icons.star, color: Colors.orangeAccent.shade400),
      ),
    );
  }
}
