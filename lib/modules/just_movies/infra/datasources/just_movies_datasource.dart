import '../../_exports.dart';

abstract class IJustMoviesDatasource {
  Future<PageMoviesModel> getMovies({required int page});
  Future<MovieDetailsModel> getMovieDetails({required int id});
}
