class Game {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;

  const Game({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title']?.toString() ?? 'Tanpa judul',
      thumbnail: json['thumbnail']?.toString() ?? '',
      shortDescription: json['short_description']?.toString() ?? '',
      gameUrl: json['game_url']?.toString() ?? '',
      genre: json['genre']?.toString() ?? 'Tidak diketahui',
      platform: json['platform']?.toString() ?? 'Tidak diketahui',
      publisher: json['publisher']?.toString() ?? 'Tidak diketahui',
      developer: json['developer']?.toString() ?? 'Tidak diketahui',
      releaseDate: json['release_date']?.toString() ?? '-',
      freetogameProfileUrl: json['freetogame_profile_url']?.toString() ?? '',
    );
  }
}
