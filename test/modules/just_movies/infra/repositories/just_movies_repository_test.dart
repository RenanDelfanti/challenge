import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';

void main() {
  late IJustMoviesRepository repository;
  late MockJustMoviesDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockJustMoviesDatasource();
    repository = JustMoviesRepositoryImpl(datasource: mockDatasource);
  });

  group('getMovies | ', () {
    group('success - ', () {
      test(
        'should return [PageMoviesEntity] when the call to datasource is successful',
        () async {
          // arrange
          when(() => mockDatasource.getMovies(page: any(named: 'page'))).thenAnswer((_) async => tPageMoviesModel);
          // act
          final result = await repository.getMovies(page: 1);
          // assert
          expect(result.isRight(), true);
          verify(() => mockDatasource.getMovies(page: 1)).called(1);
          verifyNoMoreInteractions(mockDatasource);
          expect(result.fold((l) => l, (r) => r), isA<PageMoviesEntity>());
        },
      );
    });

    group('failure - ', () {
      test(
        'should return [MoviesException] when the call to datasource is unsuccessful',
        () async {
          // arrange
          when(() => mockDatasource.getMovies(page: any(named: 'page'))).thenThrow(MoviesException('Test exception'));
          // act
          final result = await repository.getMovies(page: 1);
          // assert
          expect(result.isLeft(), true);
          verify(() => mockDatasource.getMovies(page: 1)).called(1);
          verifyNoMoreInteractions(mockDatasource);
          expect(result.fold((l) => l, (r) => r), isA<MoviesException>());
        },
      );

      test(
        'should return [MoviesException] when the call to datasource is unsuccessful (unknown error)))',
        () async {
          // arrange
          when(() => mockDatasource.getMovies(page: any(named: 'page'))).thenThrow(Exception('Test exception'));
          // act
          final result = await repository.getMovies(page: 1);
          // assert
          expect(result.isLeft(), true);
          verify(() => mockDatasource.getMovies(page: 1)).called(1);
          verifyNoMoreInteractions(mockDatasource);
          expect(result.fold((l) => l, (r) => r), isA<MoviesException>());
        },
      );
    });
  });

  group('getMovieDetails | ', () {
    group('success - ', () {
      test(
        'should return [MovieDetailsEntity] when the call to datasource is successful',
        () async {
          // arrange
          when(() => mockDatasource.getMovieDetails(id: any(named: 'id'))).thenAnswer((_) async => tMovieDetailsModel);
          // act
          final result = await repository.getMovieDetails(id: 1);
          // assert
          expect(result.isRight(), true);
          verify(() => mockDatasource.getMovieDetails(id: 1)).called(1);
          verifyNoMoreInteractions(mockDatasource);
          expect(result.fold((l) => l, (r) => r), isA<MovieDetailsEntity>());
        },
      );
    });

    group('failure - ', () {
      test(
        'should return [MoviesException] when the call to datasource is unsuccessful',
        () async {
          // arrange
          when(() => mockDatasource.getMovieDetails(id: any(named: 'id'))).thenThrow(MoviesException('Test exception'));
          // act
          final result = await repository.getMovieDetails(id: 1);
          // assert
          expect(result.isLeft(), true);
          verify(() => mockDatasource.getMovieDetails(id: 1)).called(1);
          verifyNoMoreInteractions(mockDatasource);
          expect(result.fold((l) => l, (r) => r), isA<MoviesException>());
        },
      );

      test(
        'should return [MoviesException] when the call to datasource is unsuccessful (Unknow error))',
        () async {
          // arrange
          when(() => mockDatasource.getMovieDetails(id: any(named: 'id'))).thenThrow(Exception('Test exception'));
          // act
          final result = await repository.getMovieDetails(id: 1);
          // assert
          expect(result.isLeft(), true);
          verify(() => mockDatasource.getMovieDetails(id: 1)).called(1);
          verifyNoMoreInteractions(mockDatasource);
          expect(result.fold((l) => l, (r) => r), isA<MoviesException>());
        },
      );
    });
  });
}
