import 'package:flutter/material.dart';

class NavigationTask extends StatelessWidget {
  const NavigationTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const TaskHomePage(),
        '/tujuan': (context) => const TaskTujuanPage(),
      },
    );
  }
}

class TaskHomePage extends StatelessWidget {
  const TaskHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0786C9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0786C9),
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Ini Halaman Home',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Banyak aplikasi memiliki beberapa layar untuk '
                'menampilkan informasi yang berbeda. Contohnya, '
                'ada layar produk, dan ketika pengguna mengklik '
                'produk, akan muncul layar dengan detail produk tersebut.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 28),
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/icon/house.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                "Pertama, kita perlu membuat dua halaman atau 'routes' "
                'yang ingin kita tampilkan. Selanjutnya, kita gunakan '
                'perintah Navigator.push() untuk berpindah dari halaman '
                'pertama ke halaman kedua. Ini seperti kita membuka '
                'halaman baru. Terakhir, kita bisa kembali dari halaman '
                'kedua ke halaman pertama menggunakan Navigator.pop(). '
                'Seperti menutup halaman kedua dan kembali ke halaman pertama.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 28),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF7472B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/tujuan'),
                  child: const Text('Ke halaman tujuan  ›'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskTujuanPage extends StatelessWidget {
  const TaskTujuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7472B),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7472B),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Ini Halaman Tujuan',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Untuk berpindah ke halaman baru, gunakan metode '
                'Navigator.push(). Metode push() akan menambahkan Route '
                'ke dalam tumpukan Route yang dikelola oleh Navigator. '
                'Route ini dapat dibuat secara kustom atau menggunakan '
                'MaterialPageRoute, yang memiliki animasi transisi sesuai '
                'dengan platform yang digunakan.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 28),
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/icon/island.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Untuk menutup halaman kedua dan kembali ke halaman '
                'pertama, gunakan metode Navigator.pop(). Metode pop() '
                'akan menghapus Route saat ini dari tumpukan Route yang '
                'dikelola oleh Navigator.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 28),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0786C9),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('‹  Kembali ke home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
