// coverage:ignore-file
import 'package:interfaces/interfaces.dart';

import '../_exports.dart';

class ConfigServerImpl implements IConfigServer {
  final IEnvironmentService environmentService;

  ConfigServerImpl({required this.environmentService});

  @override
  Map<Environment, Map<String, String>> configs() {
    return {
      Environment.dev: {
        ConfigServerConstants.baseUrl: 'https://api.themoviedb.org/3',
        ConfigServerConstants.imagesUrl: 'https://image.tmdb.org/t/p/w500',
      },
      Environment.prod: {
        ConfigServerConstants.baseUrl: 'https://api.themoviedb.org/3',
        ConfigServerConstants.imagesUrl: 'https://image.tmdb.org/t/p/w500',
      },
    };
  }

  @override
  String? getConfigByEnv({required String key}) {
    return (configs()[environmentService.env] ?? <String, String>{})[key];
  }
}
