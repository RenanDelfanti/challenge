import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';

void main() {
  group('CompanyModel | ', () {
    group('fromJson | toJson - ', () {
      test(
        'should return a valid model when the JSON has all the fields',
        () async {
          // arrange
          final String jsonString = tCompanyModel.toJson();
          // act
          final result = CompanyModel.fromJson(jsonString);
          // assert
          expect(result, isA<CompanyModel>());
          expect(result, tCompanyModel);
        },
      );
    });

    group('toMap - ', () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // act
          final result = tCompanyModel.toMap();
          // assert
          final expectedMap = {
            'id': 1,
            'logo_path': 'logoPath',
            'name': 'name',
            'origin_country': 'US',
          };
          expect(result, isA<Map<String, dynamic>>());
          expect(result, expectedMap);
        },
      );

      test('when pass a null map, should be throw a Exception', () {
        // act & assert
        expect(() => CompanyModel.fromMap(null), throwsA(isA<Exception>()));
      });
    });
  });
}
