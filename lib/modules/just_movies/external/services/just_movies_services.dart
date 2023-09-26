import 'package:interfaces/interfaces.dart';
import '../../../../_exports.dart';

class JustMoviesServicesImpl implements IJustMoviesServices {
  final IConfigServices _configServices;

  JustMoviesServicesImpl({required IConfigServices configServices}) : _configServices = configServices;

  @override
  String movieDetails({required int movieId}) {
    var path = _configServices.getConfigByEnv(key: ConfigServicesConstants.movieDetails) ?? '/';
    return path.replaceAll('{movie_id}', movieId.toString());
  }

  @override
  String popularMovies() {
    return _configServices.getConfigByEnv(key: ConfigServicesConstants.popularMovies) ?? '/';
  }
}
