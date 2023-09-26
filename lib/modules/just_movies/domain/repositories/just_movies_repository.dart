import 'package:dartz/dartz.dart';

import '../../../../_exports.dart';

abstract class IJustMoviesRepository {
  Future<Either<MoviesException, PageMoviesEntity>> getMovies({required int page});
  Future<Either<MoviesException, MovieDetailsEntity>> getMovieDetails({required int id});
}
