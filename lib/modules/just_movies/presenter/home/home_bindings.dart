import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:interfaces/interfaces.dart';
import '../../../../_exports.dart';

class HomeBindings extends IBindings {
  @override
  void dependencies() {
    debugPrint('HomeBindings - dependencies');

    GetIt.I.registerLazySingleton<IJustMoviesServices>(
      () => JustMoviesServicesImpl(
        configServices: GetIt.I<IConfigServices>(),
      ),
    );

    GetIt.I.registerLazySingleton<IJustMoviesRequest>(
      () => JustMoviesRequestImpl(
        secrets: GetIt.I<ISecrets>(),
        services: GetIt.I<IJustMoviesServices>(),
      ),
    );

    GetIt.I.registerLazySingleton<IJustMoviesDatasource>(
      () => TMDBDatasourceImpl(
        client: GetIt.I<IApiClient>(),
        requests: GetIt.I<IJustMoviesRequest>(),
      ),
    );

    GetIt.I.registerLazySingleton<IJustMoviesRepository>(
      () => JustMoviesRepositoryImpl(
        datasource: GetIt.I<IJustMoviesDatasource>(),
      ),
    );

    GetIt.I.registerLazySingleton<IGetMoviesUsecase>(
      () => GetMoviesUsecasImpl(
        repository: GetIt.I<IJustMoviesRepository>(),
      ),
    );

    GetIt.I.registerLazySingleton<HomeController>(
      () => HomeController(
        usecase: GetIt.I<IGetMoviesUsecase>(),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint('HomeBindings - dispose');
    GetIt.I.unregister<IJustMoviesServices>();
    GetIt.I.unregister<IJustMoviesRequest>();
    GetIt.I.unregister<IJustMoviesDatasource>();
    GetIt.I.unregister<IJustMoviesRepository>();
    GetIt.I.unregister<IGetMoviesUsecase>();
    GetIt.I.unregister<HomeController>();
  }
}
