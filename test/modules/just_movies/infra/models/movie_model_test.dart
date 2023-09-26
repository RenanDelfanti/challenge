import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';

void main() {
  group('MovieModel | ', () {
    group('fromJson | toJson - ', () {
      test(
        'should return a valid model when the JSON has all the fields',
        () async {
          // arrange
          final String jsonString = tMovieModel.toJson();
          // act
          final result = MovieModel.fromJson(jsonString);
          // assert
          expect(result, isA<MovieModel>());
          expect(result, tMovieModel);
        },
      );
    });

    group('toMap - ', () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // act
          final result = tMovieModel.toMap();
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
          };
          expect(result, isA<Map<String, dynamic>>());
          expect(result, expectedMap);
        },
      );

      test('when pass a null map, should be throw a Exception', () {
        // act & assert
        expect(() => MovieModel.fromMap(null), throwsA(isA<Exception>()));
      });
    });
  });
}
