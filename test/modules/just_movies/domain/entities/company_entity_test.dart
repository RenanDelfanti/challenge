import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';

void main() {
  const tId = 123;
  const tLogoPath = '/test_logo.png';
  const tName = 'Test Company';
  const tOriginCountry = 'US';

  const tId2 = 456;
  const tLogoPath2 = '/test_logo2.png';
  const tName2 = 'Test Company 2';
  const tOriginCountry2 = 'BR';

  group('CompanyEntity | ', () {
    test(
      'should return a valid list of props',
      () {
        // arrange
        const company = CompanyEntity(id: tId, logoPath: tLogoPath, name: tName, originCountry: tOriginCountry);
        const company2 = CompanyEntity(id: tId, logoPath: tLogoPath, name: tName, originCountry: tOriginCountry);
        const company3 = CompanyEntity(id: tId2, logoPath: tLogoPath2, name: tName2, originCountry: tOriginCountry2);
        // act
        final props = company.props;
        // assert
        expect(company, equals(company2));
        expect(company == company3, isFalse);
        expect(props.length, 4);
        expect(props, [
          tId,
          tLogoPath,
          tName,
          tOriginCountry,
        ]);
      },
    );
  });
}
