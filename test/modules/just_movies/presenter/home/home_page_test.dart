import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:interfaces/interfaces.dart';
import '../../../../mocks.dart';

void main() {
  late InitialBindings initialBindings;
  late HomeBindings homeBindings;
  late IApiClient apiClient;

  setUp(() {
    initialBindings = InitialBindings();
    homeBindings = HomeBindings();
    initialBindings.dependencies();
    GetIt.I.unregister<IApiClient>();
    apiClient = MockApiClient();
    GetIt.I.registerSingleton<IApiClient>(apiClient);
    homeBindings.dependencies();
    registerFallbackValue(FakeApiRequest());
  });

  tearDown(() {
    GetIt.I.reset();
  });

  group('HomePage | ', () {
    testWidgets('should display loading indicator - ', (tester) async {
      //arrange
      when(() => apiClient.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponsePopularMovies);
      //act
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      //assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display error message - ', (tester) async {
      //arrange
      when(() => apiClient.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponseMovieDetailsError401);
      //act
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      await tester.pumpAndSettle();
      //assert
      expect(find.text('Falha ao obter dados.'), findsOneWidget);
    });
  });
}
