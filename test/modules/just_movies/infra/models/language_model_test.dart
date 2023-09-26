import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';

void main() {
  group('LanguageModel | ', () {
    group('fromJson | toJson - ', () {
      test(
        'should return a valid model when the JSON has all the fields',
        () async {
          // arrange
          final String jsonString = tLanguageModel.toJson();
          // act
          final result = LanguageModel.fromJson(jsonString);
          // assert
          expect(result, isA<LanguageModel>());
          expect(result, tLanguageModel);
        },
      );
    });

    group('toMap - ', () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // act
          final result = tLanguageModel.toMap();
          // assert
          final expectedMap = {
            'iso_639_1': 'isoCode',
            'name': 'name',
          };
          expect(result, isA<Map<String, dynamic>>());
          expect(result, expectedMap);
        },
      );

      test('when pass a null map, should be throw a Exception', () {
        // act & assert
        expect(() => LanguageModel.fromMap(null), throwsA(isA<Exception>()));
      });
    });
  });
}
