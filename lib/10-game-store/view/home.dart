import 'package:flutter/material.dart';

import '../model/game.dart';
import '../viewmodel/fetch_game.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Game>> gameList;
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    gameList = fetchGames();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _reloadGames() async {
    setState(() {
      gameList = fetchGames();
    });

    try {
      await gameList;
    } catch (_) {
      // Error ditampilkan melalui FutureBuilder.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      appBar: AppBar(
        title: const Text('Flutter Game Store'),
        backgroundColor: Colors.amberAccent.shade400,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.trim().toLowerCase();
                  });
                },
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  hintText: 'Cari game',
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Colors.blue,
                    size: 30,
                  ),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    tooltip: 'Muat ulang',
                    icon: const Icon(Icons.refresh),
                    onPressed: _reloadGames,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List<Game>>(
                  future: gameList,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return _message(
                        'Gagal memuat game.\n${snapshot.error}',
                        retry: _reloadGames,
                      );
                    }

                    final games = snapshot.data ?? [];

                    final filteredGames = games
                        .where((game) {
                          return game.title.toLowerCase().contains(
                                _searchQuery,
                              ) ||
                              game.genre.toLowerCase().contains(_searchQuery);
                        })
                        .take(25)
                        .toList();

                    if (filteredGames.isEmpty) {
                      return const Center(child: Text('Game tidak ditemukan.'));
                    }

                    return RefreshIndicator(
                      onRefresh: _reloadGames,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: filteredGames.length,
                        itemBuilder: (context, index) {
                          final game = filteredGames[index];

                          return Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              tileColor: Colors.blue.shade50,
                              leading: SizedBox(
                                width: 75,
                                height: 75,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    game.thumbnail,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, _, _) =>
                                        const Icon(Icons.videogame_asset),
                                  ),
                                ),
                              ),
                              title: Text(
                                game.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(game.genre),
                              trailing: const Icon(Icons.more_vert),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/detail',
                                  arguments: game.id,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _message(String message, {VoidCallback? retry}) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            if (retry != null) ...[
              const SizedBox(height: 12),
              ElevatedButton(onPressed: retry, child: const Text('Coba lagi')),
            ],
          ],
        ),
      ),
    );
  }
}
