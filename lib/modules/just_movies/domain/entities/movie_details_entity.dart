import 'package:equatable/equatable.dart';
import '_exports.dart';

class MovieDetailsEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIds;
  final List<CompanyEntity> companies;
  final List<CountryEntity> countries;
  final List<LanguageEntity> languages;

  const MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.genreIds,
    required this.companies,
    required this.countries,
    required this.languages,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        backdropPath,
        overview,
        voteAverage,
        releaseDate,
        genreIds,
        companies,
        countries,
        languages,
      ];
}
