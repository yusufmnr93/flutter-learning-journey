import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/game.dart';
import '../model/detail_game.dart';

const String _baseUrl = 'https://www.freetogame.com/api';

Future<List<Game>> fetchGames() async {
  final response = await http
      .get(Uri.parse('$_baseUrl/games'))
      .timeout(const Duration(seconds: 20));

  if (response.statusCode != 200) {
    throw Exception('Gagal mengambil daftar game. HTTP ${response.statusCode}');
  }

  final decoded = jsonDecode(response.body);

  if (decoded is! List) {
    throw const FormatException('Format daftar game tidak valid.');
  }

  return decoded.whereType<Map<String, dynamic>>().map(Game.fromJson).toList();
}

Future<DetailGame> fetchGameDetail(int gameId) async {
  final response = await http
      .get(Uri.parse('$_baseUrl/game?id=$gameId'))
      .timeout(const Duration(seconds: 20));

  if (response.statusCode != 200) {
    throw Exception('Gagal mengambil detail game. HTTP ${response.statusCode}');
  }

  final decoded = jsonDecode(response.body);

  if (decoded is! Map<String, dynamic>) {
    throw const FormatException('Format detail game tidak valid.');
  }

  return DetailGame.fromJson(decoded);
}
