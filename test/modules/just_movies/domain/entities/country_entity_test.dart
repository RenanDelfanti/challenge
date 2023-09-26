import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';

void main() {
  const tIso31661 = 'US';
  const tName = 'United States';

  const tIso31662 = 'BR';
  const tName2 = 'Brazil';

  group('CountryEntity | ', () {
    test(
      'should return a valid list of props',
      () {
        // arrange
        const country = CountryEntity(iso31661: tIso31661, name: tName);
        const country2 = CountryEntity(iso31661: tIso31661, name: tName);
        const country3 = CountryEntity(iso31661: tIso31662, name: tName2);
        // act
        final props = country.props;
        // assert
        expect(country, equals(country2));
        expect(country == country3, isFalse);
        expect(props.length, 2);
        expect(props, [tIso31661, tName]);
      },
    );
  });
}
