import 'package:interfaces/interfaces.dart';
import 'package:just_movies/core/_exports.dart';
import 'package:just_movies/modules/_exports.dart';

class TMDBDatasourceImpl implements IJustMoviesDatasource {
  final IApiClient client;
  final IJustMoviesRequest requests;

  TMDBDatasourceImpl({required this.client, required this.requests});

  @override
  Future<MovieDetailsModel> getMovieDetails({required int id}) async {
    var result = await client.get(apiRequest: requests.apiRequestMovieDetails(movieId: id));
    if (!result.hasError) {
      return parseMovieDetails(result.body);
    } else {
      if (result.failure != null) {
        throw result.failure!;
      }
      throw MoviesException();
    }
  }

  @override
  Future<PageMoviesModel> getMovies({required int page}) async {
    var result = await client.get(apiRequest: requests.apiRequestPopularMovies(page: page));
    if (!result.hasError) {
      return parseMovies(result.body);
    } else {
      if (result.failure != null) {
        throw result.failure!;
      }
      throw MoviesException();
    }
  }
}
