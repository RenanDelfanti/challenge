export 'package:dartz/dartz.dart';
export 'package:mocktail/mocktail.dart';
export 'package:just_movies/_exports.dart';

import 'package:interfaces/interfaces.dart';
import 'package:just_movies/_exports.dart';
import 'package:mocktail/mocktail.dart';

class MockJustMoviesRepository extends Mock implements IJustMoviesRepository {}

class MockJustMoviesDatasource extends Mock implements IJustMoviesDatasource {}

class MockGetMoviesUsecase extends Mock implements IGetMoviesUsecase {}

class MockGetMovieDetailsUsecase extends Mock implements IGetMovieDetailsUsecase {}

class MockApiClient extends Mock implements IApiClient {}

class FakeApiRequest extends Fake implements ApiRequest {}

const PageMoviesEntity tPageMoviesEntity = PageMoviesEntity(
  page: 1,
  totalPages: 1,
  totalResults: 1,
  movies: [tMovieEntity],
);

const MovieEntity tMovieEntity = MovieEntity(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  backdropPath: 'backdropPath',
  overview: 'overview',
  voteAverage: 1.0,
  releaseDate: 'releaseDate',
  genreIds: [1],
);

const MovieDetailsEntity tMovieDetailsEntity = MovieDetailsEntity(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  backdropPath: 'backdropPath',
  overview: 'overview',
  voteAverage: 1.0,
  releaseDate: 'releaseDate',
  genreIds: [1],
  companies: [tCompanyEntity],
  countries: [tCountryEntity],
  languages: [tLanguageEntity],
);

const CompanyEntity tCompanyEntity = CompanyEntity(
  id: 1,
  logoPath: 'logoPath',
  name: 'name',
  originCountry: 'originCountry',
);

const CountryEntity tCountryEntity = CountryEntity(
  iso31661: 'isoCode',
  name: 'name',
);

const LanguageEntity tLanguageEntity = LanguageEntity(
  iso6391: 'isoCode',
  name: 'name',
);

const PageMoviesModel tPageMoviesModel = PageMoviesModel(
  page: 1,
  totalPages: 1,
  totalResults: 1,
  moviesModel: [tMovieModel],
);

const MovieModel tMovieModel = MovieModel(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  backdropPath: 'backdropPath',
  overview: 'overview',
  voteAverage: 1.0,
  releaseDate: 'releaseDate',
  genreIds: [1],
);

const MovieDetailsModel tMovieDetailsModel = MovieDetailsModel(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  backdropPath: 'backdropPath',
  overview: 'overview',
  voteAverage: 1.0,
  releaseDate: 'releaseDate',
  genreIds: [1],
  companiesModel: [tCompanyModel],
  countriesModel: [tCountryModel],
  languagesModel: [tLanguageModel],
);

const CompanyModel tCompanyModel = CompanyModel(
  id: 1,
  logoPath: 'logoPath',
  name: 'name',
  originCountry: 'US',
);

const CountryModel tCountryModel = CountryModel(
  iso31661: 'isoCode',
  name: 'name',
);

const LanguageModel tLanguageModel = LanguageModel(
  iso6391: 'isoCode',
  name: 'name',
);
