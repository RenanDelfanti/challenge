import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';

void main() {
  group('MovieDetailsModel | ', () {
    group('fromJson | toJson - ', () {
      test(
        'should return a valid model when the JSON has all the fields',
        () async {
          // arrange
          final String jsonString = tMovieDetailsModel.toJson();
          // act
          final result = MovieDetailsModel.fromJson(jsonString);
          // assert
          expect(result, isA<MovieDetailsModel>());
          expect(result, tMovieDetailsModel);
        },
      );
    });

    group('toMap - ', () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // act
          final result = tMovieDetailsModel.toMap();
          // assert
          final expectedMap = {
            'id': 1,
            'title': 'title',
            'poster_path': 'posterPath',
            'backdrop_path': 'backdropPath',
            'overview': 'overview',
            'vote_average': 1.0,
            'release_date': 'releaseDate',
            'genre_ids': [1],
            'production_companies': [
              {
                'id': 1,
                'logo_path': 'logoPath',
                'name': 'name',
                'origin_country': 'US',
              }
            ],
            'production_countries': [
              {
                'iso_3166_1': 'isoCode',
                'name': 'name',
              }
            ],
            'spoken_languages': [
              {
                'iso_639_1': 'isoCode',
                'name': 'name',
              }
            ],
          };
          expect(result, isA<Map<String, dynamic>>());
          expect(result, expectedMap);
        },
      );

      test('when pass a null map, should be throw a Exception', () {
        // act & assert
        expect(() => MovieDetailsModel.fromMap(null), throwsA(isA<Exception>()));
      });
    });
  });
}
