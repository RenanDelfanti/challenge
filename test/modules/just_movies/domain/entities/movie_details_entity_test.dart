import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';

void main() {
  const tId = 123;
  const tTitle = 'Test Movie';
  const tPosterPath = '/test_poster.jpg';
  const tBackdropPath = '/test_backdrop.jpg';
  const tOverview = 'This is a test movie';
  const tVoteAverage = 7.5;
  final tReleaseDate = DateTime.now().toIso8601String();
  const tGenreIds = [1, 2, 3];
  const tCompanies = [
    CompanyEntity(id: 1, logoPath: '/company1_logo.png', name: 'Company 1', originCountry: 'US'),
  ];
  const tCountries = [
    CountryEntity(iso31661: 'US', name: 'United States'),
  ];
  const tLanguages = [
    LanguageEntity(iso6391: 'us-US', name: 'English'),
  ];

  const tId2 = 456;
  const tTitle2 = 'Test Movie 2';
  const tPosterPath2 = '/test_poster2.jpg';
  const tBackdropPath2 = '/test_backdrop2.jpg';
  const tOverview2 = 'This is a test movie 2';
  const tVoteAverage2 = 8.5;
  final tReleaseDate2 = DateTime.now().toIso8601String();
  const tGenreIds2 = [4, 5, 6];
  const tCompanies2 = [
    CompanyEntity(id: 2, logoPath: '/company2_logo.png', name: 'Company 2', originCountry: 'BR'),
  ];
  const tCountries2 = [
    CountryEntity(iso31661: 'BR', name: 'Brazil'),
  ];
  const tLanguages2 = [
    LanguageEntity(iso6391: 'br-BR', name: 'Portuguese'),
  ];

  test(
    'should return a valid list of props',
    () {
      // arrange
      final movieDetails = MovieDetailsEntity(
        id: tId,
        title: tTitle,
        posterPath: tPosterPath,
        backdropPath: tBackdropPath,
        overview: tOverview,
        voteAverage: tVoteAverage,
        releaseDate: tReleaseDate,
        genreIds: tGenreIds,
        companies: tCompanies,
        countries: tCountries,
        languages: tLanguages,
      );
      final movieDetails2 = MovieDetailsEntity(
        id: tId,
        title: tTitle,
        posterPath: tPosterPath,
        backdropPath: tBackdropPath,
        overview: tOverview,
        voteAverage: tVoteAverage,
        releaseDate: tReleaseDate,
        genreIds: tGenreIds,
        companies: tCompanies,
        countries: tCountries,
        languages: tLanguages,
      );
      final movieDetails3 = MovieDetailsEntity(
        id: tId2,
        title: tTitle2,
        posterPath: tPosterPath2,
        backdropPath: tBackdropPath2,
        overview: tOverview2,
        voteAverage: tVoteAverage2,
        releaseDate: tReleaseDate2,
        genreIds: tGenreIds2,
        companies: tCompanies2,
        countries: tCountries2,
        languages: tLanguages2,
      );
      // act
      final props = movieDetails.props;
      // assert
      expect(movieDetails, equals(movieDetails2));
      expect(movieDetails == movieDetails3, isFalse);
      expect(props.length, 11);
      expect(props, [
        tId,
        tTitle,
        tPosterPath,
        tBackdropPath,
        tOverview,
        tVoteAverage,
        tReleaseDate,
        tGenreIds,
        tCompanies,
        tCountries,
        tLanguages,
      ]);
    },
  );
}
