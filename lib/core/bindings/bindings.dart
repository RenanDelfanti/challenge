import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:interfaces/interfaces.dart';
import '../_exports.dart';

class InitialBindings implements IBindings {
  @override
  void dependencies() {
    debugPrint('InitialBindings - dependencies');
    GetIt.I.registerSingleton<IEnvironmentService>(
      EnvironmentServiceImpl(
        getEnv(),
      ),
    );

    GetIt.I.registerSingleton<IConfigServer>(
      ConfigServerImpl(
        environmentService: GetIt.I<IEnvironmentService>(),
      ),
    );

    GetIt.I.registerSingleton<IConfigServices>(
      ConfigServicesImpl(
        environmentService: GetIt.I<IEnvironmentService>(),
      ),
    );

    GetIt.I.registerSingleton<IApiClient>(
      ApiClientImpl(
        configServerJustMovies: GetIt.I<IConfigServer>(),
      ),
    );

    GetIt.I.registerSingleton<ISecrets>(
      SecretsImpl(),
    );
  }

  @override
  void dispose() {
    debugPrint('InitialBindings - dispose');
    GetIt.I.unregister<IEnvironmentService>();
    GetIt.I.unregister<IConfigServer>();
    GetIt.I.unregister<IConfigServices>();
    GetIt.I.unregister<IApiClient>();
    GetIt.I.unregister<ISecrets>();
  }
}
