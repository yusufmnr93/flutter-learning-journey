import 'package:flutter/material.dart';

class MusicCardTask extends StatelessWidget {
  const MusicCardTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Sesuai spesifikasi tugas.
      theme: ThemeData.dark(),

      home: Scaffold(
        appBar: AppBar(title: const Text('Sedang memutar'), centerTitle: true),

        body: Center(
          child: Card(
            elevation: 4,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: 340,
                child: Row(
                  children: [
                    // Cover album menggunakan icon.
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade700,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.album,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),

                    // Jarak tetap antara cover dan informasi.
                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Lagu Favorit',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            'Nama Artis',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),

                    // Spacer membuat tombol Like
                    // terdorong ke sisi kanan.
                    const Spacer(),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
