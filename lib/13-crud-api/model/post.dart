// Model Post: cetak biru data dari JSONPlaceholder.
class Post {
  final int id;
  final int userId;
  final String title;
  final String body;
  final DateTime createdAt;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.createdAt,
  });

  // Factory constructor untuk membuat objek Post dari data JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'] ?? 1, // nilai default jika null
      title: json['title'],
      body: json['body'],
      createdAt: DateTime.now(), // waktu dicatat saat objek dibuat
    );
  }
}
