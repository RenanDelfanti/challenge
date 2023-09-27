import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';

void main() {
  late HomeController controller;
  late IGetMoviesUsecase usecase;

  setUp(() {
    usecase = MockGetMoviesUsecase();
  });

  group('description', () {
    group('success - ', () {
      test('when call fetchData, should return a HomeSuccessState', () async {
        //arrange
        when(() => usecase(page: any(named: 'page'))).thenAnswer((_) async => right(tPageMoviesEntity));
        //act
        controller = HomeController(usecase: usecase);
        await Future.delayed(const Duration(milliseconds: 100));
        //assert
        expect(controller.state, isA<HomeSuccessState>());
        verify(() => usecase(page: any(named: 'page'))).called(1);
        expect(controller.movies.length, 1);
      });

      test('when call fetchNextPage, should return a HomeSuccessState with movies', () async {
        //arrange
        when(() => usecase(page: any(named: 'page'))).thenAnswer((_) async => right(tPageMoviesEntity));
        //act
        controller = HomeController(usecase: usecase);
        await Future.delayed(const Duration(milliseconds: 100));
        //assert
        expect(controller.movies.length, 1);
        expect(controller.state, isA<HomeSuccessState>());
        //act
        controller.fetchNextPage();
        await Future.delayed(const Duration(milliseconds: 100));
        //assert
        expect(controller.state, isA<HomeSuccessState>());
        expect(controller.movies.length, 2);
        expect(controller.page, 2);
      });
    });

    group('error - ', () {
      test('when call fetchData, should return a HomeErrorState', () async {
        //arrange
        when(() => usecase(page: any(named: 'page'))).thenAnswer((_) async => left(FetchDataException()));
        //act
        controller = HomeController(usecase: usecase);
        await Future.delayed(const Duration(milliseconds: 100));
        //assert
        expect(controller.state, isA<HomeErrorState>());
        verify(() => usecase(page: any(named: 'page'))).called(1);
      });

      test('when call fetchNextPage, should return a HomeErrorState', () async {
        //arrange
        when(() => usecase(page: any(named: 'page'))).thenAnswer((_) async => right(tPageMoviesEntity));
        //act
        controller = HomeController(usecase: usecase);
        await Future.delayed(const Duration(milliseconds: 100));
        //assert
        expect(controller.movies.length, 1);
        expect(controller.state, isA<HomeSuccessState>());
        //arrange
        when(() => usecase(page: any(named: 'page'))).thenAnswer((_) async => left(FetchDataException()));
        //act
        controller.fetchNextPage();
        await Future.delayed(const Duration(milliseconds: 100));
        //assert
        expect(controller.state, isA<HomeErrorState>());
        expect(controller.movies.length, 1);
        expect(controller.page, 2);
      });
    });
  });
}
