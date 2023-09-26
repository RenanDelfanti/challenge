import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';

void main() {
  const tId = 123;
  const tTitle = 'Test Movie';
  const tPosterPath = '/test_poster.jpg';
  const tBackdropPath = '/test_backdrop.jpg';
  const tOverview = 'This is a test movie';
  const tVoteAverage = 7.5;
  const tReleaseDate = '2021-10-01';
  const tGenreIds = [1, 2, 3];

  const tId2 = 456;
  const tTitle2 = 'Test Movie 2';
  const tPosterPath2 = '/test_poster2.jpg';
  const tBackdropPath2 = '/test_backdrop2.jpg';
  const tOverview2 = 'This is a test movie 2';
  const tVoteAverage2 = 8.5;
  const tReleaseDate2 = '2021-10-02';
  const tGenreIds2 = [4, 5, 6];

  test('should return a valid list of props', () {
    // arrange
    const movie = MovieEntity(
      id: tId,
      title: tTitle,
      posterPath: tPosterPath,
      backdropPath: tBackdropPath,
      overview: tOverview,
      voteAverage: tVoteAverage,
      releaseDate: tReleaseDate,
      genreIds: tGenreIds,
    );
    const movie2 = MovieEntity(
      id: tId,
      title: tTitle,
      posterPath: tPosterPath,
      backdropPath: tBackdropPath,
      overview: tOverview,
      voteAverage: tVoteAverage,
      releaseDate: tReleaseDate,
      genreIds: tGenreIds,
    );
    const movie3 = MovieEntity(
      id: tId2,
      title: tTitle2,
      posterPath: tPosterPath2,
      backdropPath: tBackdropPath2,
      overview: tOverview2,
      voteAverage: tVoteAverage2,
      releaseDate: tReleaseDate2,
      genreIds: tGenreIds2,
    );
    // act
    final props = movie.props;
    // assert
    expect(movie, equals(movie2));
    expect(movie == movie3, isFalse);
    expect(props.length, 8);
    expect(props, [
      tId,
      tTitle,
      tPosterPath,
      tBackdropPath,
      tOverview,
      tVoteAverage,
      tReleaseDate,
      tGenreIds,
    ]);
  });
}
