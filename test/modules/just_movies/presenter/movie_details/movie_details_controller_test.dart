import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';

void main() {
  late MovieDetailsController controller;
  late IGetMovieDetailsUsecase usecase;
  int tMovieId = 1;
  String tTitle = 'title';

  setUp(() {
    usecase = MockGetMovieDetailsUsecase();
  });

  group('MovieDetailsController | ', () {
    group('success', () {
      test('when call fetchData, should return a MovieDetailsSuccessState', () async {
        //arrange
        when(() => usecase(id: any(named: 'id'))).thenAnswer((_) async => right(tMovieDetailsEntity));
        //act
        controller = MovieDetailsController(usecase: usecase, movieId: tMovieId, title: tTitle);
        await Future.delayed(const Duration(milliseconds: 100));
        //assert
        expect(controller.state, isA<MovieDetailsSuccessState>());
        verify(() => usecase(id: any(named: 'id'))).called(1);
      });
    });

    group('error', () {
      test('when call fetchData, should return a MovieDetailsErrorState', () async {
        //arrange
        when(() => usecase(id: any(named: 'id'))).thenAnswer((_) async => left(FetchDataException()));
        //act
        controller = MovieDetailsController(usecase: usecase, movieId: tMovieId, title: tTitle);
        await Future.delayed(const Duration(milliseconds: 100));
        //assert
        expect(controller.state, isA<MovieDetailsErrorState>());
        verify(() => usecase(id: any(named: 'id'))).called(1);
      });
    });
  });
}
