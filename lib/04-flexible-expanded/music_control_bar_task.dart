import 'package:flutter/material.dart';

class MusicControlBarTask extends StatelessWidget {
  const MusicControlBarTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Sesuai spesifikasi modul.
      theme: ThemeData.dark(),

      home: Scaffold(
        body: const Center(
          child: Text('Pemutar Musik', style: TextStyle(fontSize: 16)),
        ),

        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          color: Colors.black54,

          child: Row(
            children: [
              // Expanded membagi ruang secara merata.
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shuffle, color: Colors.white),
                ),
              ),

              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous, color: Colors.white),
                ),
              ),

              // Play dibuat lebih besar menggunakan Flexible.
              Flexible(
                // flex 2 = mendapatkan ruang 2x dibanding
                // Expanded dengan flex 1.
                flex: 2,

                fit: FlexFit.tight,

                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 42,
                  ),
                ),
              ),

              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next, color: Colors.white),
                ),
              ),

              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.repeat, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
