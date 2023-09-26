import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';

void main() {
  const tPage = 1;
  const tMovies = [
    MovieEntity(
      id: 1,
      title: 'Test Movie 1',
      posterPath: '/test_poster1.jpg',
      backdropPath: '/test_backdrop1.jpg',
      overview: 'This is a test movie 1',
      voteAverage: 7.5,
      releaseDate: '2021-10-01',
      genreIds: [1, 2, 3],
    ),
    MovieEntity(
      id: 2,
      title: 'Test Movie 2',
      posterPath: '/test_poster2.jpg',
      backdropPath: '/test_backdrop2.jpg',
      overview: 'This is a test movie 2',
      voteAverage: 8.0,
      releaseDate: '2021-11-01',
      genreIds: [4, 5, 6],
    ),
  ];
  const tTotalPages = 2;
  const tTotalResults = 20;

  const tPage2 = 2;
  const tMovies2 = [
    MovieEntity(
      id: 3,
      title: 'Test Movie 3',
      posterPath: '/test_poster3.jpg',
      backdropPath: '/test_backdrop3.jpg',
      overview: 'This is a test movie 3',
      voteAverage: 7.5,
      releaseDate: '2021-10-01',
      genreIds: [1, 2, 3],
    ),
    MovieEntity(
      id: 4,
      title: 'Test Movie 4',
      posterPath: '/test_poster4.jpg',
      backdropPath: '/test_backdrop4.jpg',
      overview: 'This is a test movie 4',
      voteAverage: 8.0,
      releaseDate: '2021-11-01',
      genreIds: [4, 5, 6],
    ),
  ];
  const tTotalPages2 = 2;
  const tTotalResults2 = 20;

  test(
    'should return a valid list of props',
    () {
      // arrange
      const pageMovies = PageMoviesEntity(
        page: tPage,
        movies: tMovies,
        totalPages: tTotalPages,
        totalResults: tTotalResults,
      );
      const pageMovies2 = PageMoviesEntity(
        page: tPage,
        movies: tMovies,
        totalPages: tTotalPages,
        totalResults: tTotalResults,
      );

      const pageMovies3 = PageMoviesEntity(
        page: tPage2,
        movies: tMovies2,
        totalPages: tTotalPages2,
        totalResults: tTotalResults2,
      );
      // act
      final props = pageMovies.props;
      // assert
      expect(pageMovies, equals(pageMovies2));
      expect(pageMovies == pageMovies3, isFalse);
      expect(props.length, 4);
      expect(props, [
        tPage,
        tMovies,
        tTotalPages,
        tTotalResults,
      ]);
    },
  );
}
