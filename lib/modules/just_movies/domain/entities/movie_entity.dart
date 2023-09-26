import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIds;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.genreIds,
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
      ];
}
