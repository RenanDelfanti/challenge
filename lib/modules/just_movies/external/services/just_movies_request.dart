import 'package:interfaces/interfaces.dart';
import '../../../../_exports.dart';
import '../../_exports.dart';

class JustMoviesRequestImpl extends IJustMoviesRequest {
  final IJustMoviesServices services;
  final ISecrets secrets;

  JustMoviesRequestImpl({
    required this.services,
    required this.secrets,
  });

  @override
  ApiRequest apiRequestMovieDetails({required int movieId}) {
    return ApiRequest(
      path: services.movieDetails(movieId: movieId),
      queryParameters: {
        'api_key': secrets.apiKey(),
        'language': 'pt-BR',
      },
      simulateMock: apiResponseMovieDetails,
    );
  }

  @override
  ApiRequest apiRequestPopularMovies({int? page}) {
    return ApiRequest(
      path: services.popularMovies(),
      queryParameters: {
        'api_key': secrets.apiKey(),
        'language': 'pt-BR',
        'page': page ?? 1,
      },
      simulateMock: apiResponsePopularMovies,
    );
  }
}
