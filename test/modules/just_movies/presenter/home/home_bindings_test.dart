import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:interfaces/interfaces.dart';

import '../../../../mocks.dart';

void main() {
  late HomeBindings homeBindings;
  late InitialBindings initialBindings;

  setUp(() {
    initialBindings = InitialBindings();
    homeBindings = HomeBindings();
    initialBindings.dependencies();
  });

  tearDown(() {
    homeBindings.dispose();
    initialBindings.dispose();
  });

  group('HomeBindings | ', () {
    test('should register all dependencies - ', () {
      // arrange & act
      homeBindings.dependencies();
      // assert
      expect(GetIt.I.isRegistered<IEnvironmentService>(), isTrue);
      expect(GetIt.I.isRegistered<IConfigServer>(), isTrue);
      expect(GetIt.I.isRegistered<IConfigServices>(), isTrue);
      expect(GetIt.I.isRegistered<IApiClient>(), isTrue);
      expect(GetIt.I.isRegistered<ISecrets>(), isTrue);

      expect(GetIt.I<IEnvironmentService>(), isA<EnvironmentServiceImpl>());
      expect(GetIt.I<IConfigServer>(), isA<ConfigServerImpl>());
      expect(GetIt.I<IConfigServices>(), isA<ConfigServicesImpl>());
      expect(GetIt.I<IApiClient>(), isA<ApiClientImpl>());
      expect(GetIt.I<ISecrets>(), isA<SecretsImpl>());

      expect(GetIt.I.isRegistered<IJustMoviesServices>(), isTrue);
      expect(GetIt.I.isRegistered<IJustMoviesRequest>(), isTrue);
      expect(GetIt.I.isRegistered<IJustMoviesDatasource>(), isTrue);
      expect(GetIt.I.isRegistered<IJustMoviesRepository>(), isTrue);
      expect(GetIt.I.isRegistered<IGetMoviesUsecase>(), isTrue);
      expect(GetIt.I.isRegistered<HomeController>(), isTrue);

      expect(GetIt.I<IJustMoviesServices>(), isA<JustMoviesServicesImpl>());
      expect(GetIt.I<IJustMoviesRequest>(), isA<JustMoviesRequestImpl>());
      expect(GetIt.I<IJustMoviesDatasource>(), isA<TMDBDatasourceImpl>());
      expect(GetIt.I<IJustMoviesRepository>(), isA<JustMoviesRepositoryImpl>());
      expect(GetIt.I<IGetMoviesUsecase>(), isA<GetMoviesUsecasImpl>());
      expect(GetIt.I<HomeController>(), isA<HomeController>());
    });
  });
}
