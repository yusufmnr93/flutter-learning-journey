import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'game_api_detail.dart';
import 'screen_arguments.dart';

class GameApiHome extends StatelessWidget {
  const GameApiHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0081C9)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GameHomePage(),
        GameApiDetail.routeName: (context) => const GameApiDetail(),
      },
    );
  }
}

class GameHomePage extends StatefulWidget {
  const GameHomePage({super.key});

  @override
  State<GameHomePage> createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {
  String? title;
  String? thumbnail;
  String? shortDescription;
  String? description;
  String? genre;
  String? platform;
  String? release;
  String? cover;
  String? publisher;
  String? gameId;
  String? errorMessage;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getGame('475');
  }

  Future<void> getGame(String id) async {
    try {
      final response = await http
          .get(Uri.parse('https://www.freetogame.com/api/game?id=$id'))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode != 200) {
        throw Exception(
          'Server API merespons dengan status '
          '${response.statusCode}.',
        );
      }

      final dynamic decoded = jsonDecode(response.body);

      if (decoded is! Map<String, dynamic>) {
        throw const FormatException('Format data game tidak sesuai.');
      }

      final screenshots = decoded['screenshots'];

      String imageCover = (decoded['thumbnail'] ?? '').toString();

      if (screenshots is List &&
          screenshots.isNotEmpty &&
          screenshots.first is Map) {
        imageCover = (screenshots.first['image'] ?? imageCover).toString();
      }

      if (!mounted) return;

      setState(() {
        gameId = id;
        title = (decoded['title'] ?? 'Game tanpa judul').toString();
        thumbnail = (decoded['thumbnail'] ?? '').toString();
        shortDescription = (decoded['short_description'] ?? '').toString();
        description = (decoded['description'] ?? 'Deskripsi tidak tersedia.')
            .toString();
        genre = (decoded['genre'] ?? '-').toString();
        platform = (decoded['platform'] ?? '-').toString();
        publisher = (decoded['publisher'] ?? '-').toString();
        release = (decoded['release_date'] ?? '-').toString();
        cover = imageCover;
        isLoading = false;
        errorMessage = null;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
        errorMessage =
            'Data game belum dapat dimuat. '
            'Periksa koneksi internet atau akses API FreeToGame.\n'
            '$error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0081C9),
      appBar: AppBar(
        title: const Text('Informasi Game'),
        backgroundColor: const Color(0xFF0081C9),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : errorMessage != null
              ? Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.cloud_off,
                        color: Colors.white,
                        size: 48,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          getGame('475');
                        },
                        child: const Text('Coba Lagi'),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        GameApiDetail.routeName,
                        arguments: ScreenArguments(
                          cover ?? thumbnail ?? '',
                          title ?? 'Game',
                          description ?? '',
                          shortDescription ?? '',
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if ((thumbnail ?? '').isNotEmpty)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                thumbnail!,
                                width: double.infinity,
                                height: 190,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const SizedBox(
                                    height: 190,
                                    child: Center(
                                      child: Icon(
                                        Icons.videogame_asset,
                                        size: 60,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          const SizedBox(height: 15),
                          Text(
                            title ?? '',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text('Genre: ${genre ?? '-'}')),
                              Expanded(
                                child: Text('Platform: ${platform ?? '-'}'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text('Publisher: ${publisher ?? '-'}'),
                          Text('Release: ${release ?? '-'}'),
                          const SizedBox(height: 14),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Lihat detail'),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward_rounded, size: 18),
                              ],
                            ),
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
