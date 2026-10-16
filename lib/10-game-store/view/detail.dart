import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../model/detail_game.dart';
import '../viewmodel/fetch_game.dart';

class Detail extends StatelessWidget {
  final int gameTerpilih;

  const Detail({super.key, required this.gameTerpilih});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      body: FutureBuilder<DetailGame>(
        future: fetchGameDetail(gameTerpilih),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return _errorView(
              context,
              'Terjadi kesalahan saat mengambil detail game.\n'
              '${snapshot.error}',
            );
          }

          if (!snapshot.hasData) {
            return _errorView(context, 'Data game tidak tersedia.');
          }

          final game = snapshot.data!;

          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      child: Image.network(
                        game.thumbnail,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          color: Colors.blueGrey,
                          child: const Icon(
                            Icons.videogame_asset,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: 12,
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          tooltip: 'Kembali',
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: Text(
                        game.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(color: Colors.black87, blurRadius: 8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Informasi Game',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _requirementRow('Genre', game.genre),
                        _requirementRow('Platform', game.platform),
                        _requirementRow('Publisher', game.publisher),
                        _requirementRow('Developer', game.developer),
                        _requirementRow('Tanggal rilis', game.releaseDate),
                        const Divider(height: 24),
                        const Text(
                          'Minimum System Requirements',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _requirementRow(
                          'OS',
                          game.minimumSystemRequirements.os,
                        ),
                        _requirementRow(
                          'Processor',
                          game.minimumSystemRequirements.processor,
                        ),
                        _requirementRow(
                          'Memory',
                          game.minimumSystemRequirements.memory,
                        ),
                        _requirementRow(
                          'Graphics',
                          game.minimumSystemRequirements.graphics,
                        ),
                        _requirementRow(
                          'Storage',
                          game.minimumSystemRequirements.storage,
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'Screenshot Game',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (game.screenshots.isEmpty)
                          const Text('Screenshot tidak tersedia.')
                        else
                          SizedBox(
                            height: 160,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: game.screenshots.length,
                              separatorBuilder: (_, _) =>
                                  const SizedBox(width: 15),
                              itemBuilder: (context, index) {
                                return _screenshot(
                                  game.screenshots[index].image,
                                );
                              },
                            ),
                          ),
                        const SizedBox(height: 18),
                        const Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        ReadMoreText(
                          game.description.isEmpty
                              ? 'Deskripsi tidak tersedia.'
                              : game.description,
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'more',
                          trimExpandedText: 'less',
                          colorClickableText: Colors.blue,
                          style: TextStyle(
                            color: Colors.black54.withValues(alpha: 0.9),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _errorView(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _screenshot(String url) {
  return SizedBox(
    width: 250,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => Container(
          color: Colors.black12,
          child: const Icon(Icons.broken_image, size: 40),
        ),
      ),
    ),
  );
}

Widget _requirementRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(title, style: const TextStyle(color: Colors.black54)),
        ),
        const Text(': '),
        Expanded(
          flex: 8,
          child: Text(
            value.isEmpty ? '-' : value,
            style: const TextStyle(color: Colors.black54),
          ),
        ),
      ],
    ),
  );
}
