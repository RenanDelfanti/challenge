import 'package:equatable/equatable.dart';
import '_exports.dart';

class PageMoviesEntity extends Equatable {
  final int page;
  final List<MovieEntity> movies;
  final int totalPages;
  final int totalResults;

  const PageMoviesEntity({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [
        page,
        movies,
        totalPages,
        totalResults,
      ];
}
