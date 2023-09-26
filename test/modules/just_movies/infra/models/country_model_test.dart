import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';

void main() {
  group('CountryModel | ', () {
    group('fromJson | toJson - ', () {
      test(
        'should return a valid model when the JSON has all the fields',
        () async {
          // arrange
          final String jsonString = tCountryModel.toJson();
          // act
          final result = CountryModel.fromJson(jsonString);
          // assert
          expect(result, isA<CountryModel>());
          expect(result, tCountryModel);
        },
      );
    });

    group('toMap - ', () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // act
          final result = tCountryModel.toMap();
          // assert
          final expectedMap = {
            'iso_3166_1': 'isoCode',
            'name': 'name',
          };
          expect(result, isA<Map<String, dynamic>>());
          expect(result, expectedMap);
        },
      );

      test('when pass a null map, should be throw a Exception', () {
        // act & assert
        expect(() => CountryModel.fromMap(null), throwsA(isA<Exception>()));
      });
    });
  });
}
