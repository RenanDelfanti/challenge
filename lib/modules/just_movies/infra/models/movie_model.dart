import 'dart:convert';

import '../../_exports.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.genreIds,
  });

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source));

  factory MovieModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) throw Exception('Null map provided to MovieModel.fromMap()');
    return MovieModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      posterPath: map['poster_path'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      overview: map['overview'] ?? '',
      voteAverage: double.tryParse(map['vote_average'].toString()) ?? 0.0,
      releaseDate: map['release_date'] ?? '',
      genreIds: List<int>.from(map['genre_ids'] ?? const []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'overview': overview,
      'vote_average': voteAverage,
      'release_date': releaseDate,
      'genre_ids': genreIds,
    };
  }

  String toJson() => json.encode(toMap());
}
