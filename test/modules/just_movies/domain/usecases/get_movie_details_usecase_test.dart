import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';

void main() {
  late IGetMovieDetailsUsecase usecase;
  late IJustMoviesRepository mockRepository;

  setUp(() {
    mockRepository = MockJustMoviesRepository();
    usecase = GetMovieDetailsUsecaseImpl(repository: mockRepository);
  });

  group('IGetMovieDetailsUsecase | ', () {
    group('success - ', () {
      test(
        'when called with valida id, should return MovieDetailsEntity',
        () async {
          // arrange
          when(() => mockRepository.getMovieDetails(id: any(named: 'id'))).thenAnswer((_) async => right(tMovieDetailsEntity));
          // act
          final result = await usecase.call(id: 1);
          // assert
          expect(result.isRight(), true);
          expect(result.fold((l) => l, (r) => r), isA<MovieDetailsEntity>());
          verify(() => mockRepository.getMovieDetails(id: 1)).called(1);
          verifyNoMoreInteractions(mockRepository);
        },
      );
    });

    group('failure - ', () {
      test(
        'when called with invalid id, should return a NotFoundException',
        () async {
          // arrange
          when(() => mockRepository.getMovieDetails(id: any(named: 'id'))).thenAnswer((_) async => left(NotFoundException()));
          // act
          final result = await usecase.call(id: 0);
          // assert
          expect(result.isLeft(), true);
          expect(result.fold((l) => l, (r) => r), isA<NotFoundException>());
          verify(() => mockRepository.getMovieDetails(id: 0)).called(1);
          verifyNoMoreInteractions(mockRepository);
        },
      );
    });
  });
}
