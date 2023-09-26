import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';

void main() {
  late IGetMoviesUsecase usecase;
  late IJustMoviesRepository mockRepository;

  setUp(() {
    mockRepository = MockJustMoviesRepository();
    usecase = GetMoviesUsecasImpl(repository: mockRepository);
  });

  group('IGetMoviesUsecase | ', () {
    group('success - ', () {
      test(
        'when called with valid page, should return PageMoviesEntity',
        () async {
          // arrange
          when(() => mockRepository.getMovies(page: any(named: 'page'))).thenAnswer((_) async => right(tPageMoviesEntity));
          // act
          final result = await usecase.call(page: 1);
          // assert
          expect(result.isRight(), true);
          expect(result.fold((l) => l, (r) => r), isA<PageMoviesEntity>());
          verify(() => mockRepository.getMovies(page: 1)).called(1);
          verifyNoMoreInteractions(mockRepository);
        },
      );
    });

    group('failure - ', () {
      test(
        'when called with invalid page, should return a NotFoundException',
        () async {
          // arrange
          when(() => mockRepository.getMovies(page: any(named: 'page'))).thenAnswer((_) async => left(NotFoundException()));
          // act
          final result = await usecase.call(page: 0);
          // assert
          expect(result.isLeft(), true);
          expect(result.fold((l) => l, (r) => r), isA<NotFoundException>());
          verify(() => mockRepository.getMovies(page: 0)).called(1);
          verifyNoMoreInteractions(mockRepository);
        },
      );
    });
  });
}
