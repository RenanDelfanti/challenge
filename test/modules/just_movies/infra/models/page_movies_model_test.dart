import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';

void main() {
  group('PageMoviesModel | ', () {
    group('fromJson | toJson - ', () {
      test(
        'should return a valid model when the JSON has all the fields',
        () async {
          // arrange
          final String jsonString = tPageMoviesModel.toJson();
          // act
          final result = PageMoviesModel.fromJson(jsonString);
          // assert
          expect(result, isA<PageMoviesModel>());
          expect(result, tPageMoviesModel);
        },
      );
    });

    group('toMap - ', () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // act
          final result = tPageMoviesModel.toMap();
          // assert
          final expectedMap = {
            'page': 1,
            'total_pages': 1,
            'total_results': 1,
            'results': [
              {
                'id': 1,
                'title': 'title',
                'poster_path': 'posterPath',
                'backdrop_path': 'backdropPath',
                'overview': 'overview',
                'vote_average': 1.0,
                'release_date': 'releaseDate',
                'genre_ids': [1],
              },
            ],
          };
          expect(result, isA<Map<String, dynamic>>());
          expect(result, expectedMap);
        },
      );

      test('when pass a null map, should be throw a Exception', () {
        // act & assert
        expect(() => PageMoviesModel.fromMap(null), throwsA(isA<Exception>()));
      });
    });
  });
}
