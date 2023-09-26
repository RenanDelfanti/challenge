import 'package:interfaces/interfaces.dart';

abstract class IJustMoviesRequest {
  ApiRequest apiRequestPopularMovies({int? page});
  ApiRequest apiRequestMovieDetails({required int movieId});
}
