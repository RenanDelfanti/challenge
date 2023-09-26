import 'package:dartz/dartz.dart';
import '../../../../_exports.dart';

class JustMoviesRepositoryImpl implements IJustMoviesRepository {
  final IJustMoviesDatasource datasource;

  JustMoviesRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<MoviesException, PageMoviesEntity>> getMovies({required int page}) async {
    try {
      final result = await datasource.getMovies(page: page);
      return right(result);
    } on MoviesException catch (e) {
      return left(e);
    } catch (e) {
      return left(MoviesException(e.toString()));
    }
  }

  @override
  Future<Either<MoviesException, MovieDetailsEntity>> getMovieDetails({required int id}) async {
    try {
      final result = await datasource.getMovieDetails(id: id);
      return right(result);
    } on MoviesException catch (e) {
      return left(e);
    } catch (e) {
      return left(MoviesException(e.toString()));
    }
  }
}
