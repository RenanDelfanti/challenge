import 'dart:convert';

import '../../_exports.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.genreIds,
    required this.companiesModel,
    required this.countriesModel,
    required this.languagesModel,
  }) : super(
          companies: companiesModel,
          countries: countriesModel,
          languages: languagesModel,
        );

  final List<CompanyModel> companiesModel;
  final List<CountryModel> countriesModel;
  final List<LanguageModel> languagesModel;

  factory MovieDetailsModel.fromJson(String source) => MovieDetailsModel.fromMap(json.decode(source));

  factory MovieDetailsModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) throw Exception('Null map provided to MovieDetailsModel.fromMap()');
    return MovieDetailsModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      posterPath: map['poster_path'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      overview: map['overview'] ?? '',
      voteAverage: map['vote_average'] ?? 0.0,
      releaseDate: map['release_date'] ?? '',
      genreIds: List<int>.from(map['genre_ids']?.map((x) => x) ?? []),
      companiesModel: List<CompanyModel>.from(map['production_companies']?.map((x) => CompanyModel.fromMap(x)) ?? const []),
      countriesModel: List<CountryModel>.from(map['production_countries']?.map((x) => CountryModel.fromMap(x)) ?? const []),
      languagesModel: List<LanguageModel>.from(map['spoken_languages']?.map((x) => LanguageModel.fromMap(x)) ?? const []),
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
      'production_companies': companiesModel.map((x) => x.toMap()).toList(),
      'production_countries': countriesModel.map((x) => x.toMap()).toList(),
      'spoken_languages': languagesModel.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
