import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:interfaces/interfaces.dart';

import '../../mocks.dart';

void main() {
  late InitialBindings initialBindings;

  setUp(() {
    initialBindings = InitialBindings();
  });

  tearDown(() {
    initialBindings.dispose();
  });

  group('InitialBindings | ', () {
    test('should register all dependencies - ', () {
      // arrange & act
      initialBindings.dependencies();
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
    });
  });
}
