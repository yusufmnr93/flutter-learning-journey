import 'package:json_annotation/json_annotation.dart';

part 'detail_game.g.dart';

@JsonSerializable()
class MinimumSystemRequirements {
  final String os;
  final String processor;
  final String memory;
  final String graphics;
  final String storage;

  const MinimumSystemRequirements({
    this.os = '-',
    this.processor = '-',
    this.memory = '-',
    this.graphics = '-',
    this.storage = '-',
  });

  factory MinimumSystemRequirements.fromJson(Map<String, dynamic> json) =>
      _$MinimumSystemRequirementsFromJson(json);

  Map<String, dynamic> toJson() => _$MinimumSystemRequirementsToJson(this);
}

@JsonSerializable()
class Screenshot {
  final int id;
  final String image;

  const Screenshot({required this.id, required this.image});

  factory Screenshot.fromJson(Map<String, dynamic> json) =>
      _$ScreenshotFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenshotToJson(this);
}

@JsonSerializable()
class DetailGame {
  final int id;
  final String title;
  final String thumbnail;
  final String status;

  @JsonKey(name: 'short_description')
  final String shortDescription;

  final String description;

  @JsonKey(name: 'game_url')
  final String gameUrl;

  final String genre;
  final String platform;
  final String publisher;
  final String developer;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  @JsonKey(name: 'freetogame_profile_url')
  final String freetogameProfileUrl;

  @JsonKey(name: 'minimum_system_requirements')
  final MinimumSystemRequirements minimumSystemRequirements;

  final List<Screenshot> screenshots;

  const DetailGame({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.status,
    required this.shortDescription,
    required this.description,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
    required this.minimumSystemRequirements,
    required this.screenshots,
  });

  factory DetailGame.fromJson(Map<String, dynamic> json) {
    final normalizedJson = Map<String, dynamic>.from(json);

    normalizedJson['minimum_system_requirements'] ??= <String, dynamic>{
      'os': '-',
      'processor': '-',
      'memory': '-',
      'graphics': '-',
      'storage': '-',
    };

    normalizedJson['screenshots'] ??= <dynamic>[];

    return _$DetailGameFromJson(normalizedJson);
  }

  Map<String, dynamic> toJson() => _$DetailGameToJson(this);
}
