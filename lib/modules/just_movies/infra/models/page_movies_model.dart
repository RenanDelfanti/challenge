import 'dart:convert';

import '../../_exports.dart';

class PageMoviesModel extends PageMoviesEntity {
  const PageMoviesModel({
    required super.page,
    required super.totalPages,
    required super.totalResults,
    required this.moviesModel,
  }) : super(
          movies: moviesModel,
        );

  final List<MovieModel> moviesModel;

  factory PageMoviesModel.fromJson(String source) => PageMoviesModel.fromMap(json.decode(source));

  factory PageMoviesModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) throw Exception('Null map provided to PageMoviesModel.fromMap()');
    return PageMoviesModel(
      page: map['page'] ?? 0,
      totalPages: map['total_pages'] ?? 0,
      totalResults: map['total_results'] ?? 0,
      moviesModel: List<MovieModel>.from(map['results']?.map((x) => MovieModel.fromMap(x)) ?? const []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'total_pages': totalPages,
      'total_results': totalResults,
      'results': moviesModel.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
