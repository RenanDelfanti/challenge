import 'package:flutter_test/flutter_test.dart';
import 'package:interfaces/interfaces.dart';

import '../../../../mocks.dart';

void main() {
  late IJustMoviesDatasource datasource;
  late IApiClient client;
  late IJustMoviesRequest requests;
  late IJustMoviesServices services;

  setUp(() {
    client = MockApiClient();
    services = JustMoviesServicesImpl(
      configServices: ConfigServicesImpl(
        environmentService: EnvironmentServiceImpl(
          Environment.dev,
        ),
      ),
    );
    requests = JustMoviesRequestImpl(
      services: services,
      secrets: SecretsImpl(),
    );
    datasource = TMDBDatasourceImpl(
      client: client,
      requests: requests,
    );

    registerFallbackValue(FakeApiRequest());
  });

  group('IJustMoviesDatasource | ', () {
    group('getMovies | ', () {
      group('success - ', () {
        test('when server return a 200 status code and a valid json, should be return a PageMoviesModel ', () async {
          // arrange
          when(() => client.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponsePopularMovies);
          // act
          final result = await datasource.getMovies(page: 1);
          // assert
          expect(result, isA<PageMoviesModel>());
        });
      });
      group('failure - ', () {
        test('when server return a 401 status code, should be return a UnauthorisedException', () async {
          // arrange
          when(() => client.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponsePopularMoviesError401);
          // act & assert
          expect(() async => await datasource.getMovies(page: 1), throwsA(isA<UnauthorisedException>()));
        });

        test('when server return a 404 status code, should be return a NotFoundException', () async {
          // arrange
          when(() => client.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponsePopularMoviesError404);
          // act & assert
          expect(() async => await datasource.getMovies(page: 1), throwsA(isA<NotFoundException>()));
        });

        test('when server return a 500 status code, should be return a FetchDataException', () async {
          // arrange
          when(() => client.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponsePopularMoviesError500);
          // act & assert
          expect(() async => await datasource.getMovies(page: 1), throwsA(isA<FetchDataException>()));
        });

        test('when server return a 500 status code and apiclient fail to parse, should be return a MoviesException', () async {
          // arrange
          when(() => client.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponsePopularMoviesErrorApiClient);
          // act & assert
          expect(() async => await datasource.getMovies(page: 1), throwsA(isA<MoviesException>()));
        });
      });
    });
  });

  group('getMovieDetails | ', () {
    group('success - ', () {
      test('when server return a 200 status code and a valid json, should be return a MovieDetailsModel ', () async {
        // arrange
        when(() => client.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponseMovieDetails);
        // act
        final result = await datasource.getMovieDetails(id: 1);
        // assert
        expect(result, isA<MovieDetailsModel>());
      });
    });
    group('failure - ', () {
      test('when server return a 401 status code, should be return a UnauthorisedException', () async {
        // arrange
        when(() => client.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponseMovieDetailsError401);
        // act & assert
        expect(() async => await datasource.getMovieDetails(id: 1), throwsA(isA<UnauthorisedException>()));
      });

      test('when server return a 404 status code, should be return a NotFoundException', () async {
        // arrange
        when(() => client.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponseMovieDetailsError404);
        // act & assert
        expect(() async => await datasource.getMovieDetails(id: 1), throwsA(isA<NotFoundException>()));
      });

      test('when server return a 500 status code, should be return a FetchDataException', () async {
        // arrange
        when(() => client.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponseMovieDetailsError500);
        // act & assert
        expect(() async => await datasource.getMovieDetails(id: 1), throwsA(isA<FetchDataException>()));
      });

      test('when server return a 500 status code and apiclient fail to parse, should be return a MoviesException', () async {
        // arrange
        when(() => client.get(apiRequest: any(named: 'apiRequest'))).thenAnswer((_) async => apiResponseMovieDetailsErrorApiClient);
        // act & assert
        expect(() async => await datasource.getMovieDetails(id: 1), throwsA(isA<MoviesException>()));
      });
    });
  });
}
