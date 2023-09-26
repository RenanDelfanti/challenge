import 'package:interfaces/interfaces.dart';

import '../_exports.dart';

class ConfigServicesImpl implements IConfigServices {
  final IEnvironmentService environmentService;

  ConfigServicesImpl({required this.environmentService});

  @override
  Map<Environment, Map<String, String>> configs() {
    return {
      Environment.dev: {
        ConfigServicesConstants.popularMovies: '/movie/popular',
        ConfigServicesConstants.movieDetails: '/movie/{movie_id}',
      },
      Environment.prod: {
        ConfigServicesConstants.popularMovies: '/movie/popular',
        ConfigServicesConstants.movieDetails: '/movie/{movie_id}',
      },
    };
  }

  @override
  String? getConfigByEnv({required String key}) {
    return (configs()[environmentService.env] ?? <String, String>{})[key];
  }
}
