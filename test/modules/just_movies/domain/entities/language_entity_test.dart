import 'package:flutter_test/flutter_test.dart';
import '../../../../mocks.dart';

void main() {
  const tIso6391 = 'en';
  const tName = 'English';

  const tIso6392 = 'pt';
  const tName2 = 'Portuguese';

  group('LanguageEntity', () {
    test('should return a valid list of props', () {
      // arrange
      const language = LanguageEntity(iso6391: tIso6391, name: tName);
      const language2 = LanguageEntity(iso6391: tIso6391, name: tName);
      const language3 = LanguageEntity(iso6391: tIso6392, name: tName2);

      // act
      final props = language.props;
      // assert
      expect(language, equals(language2));
      expect(language == language3, isFalse);
      expect(props.length, 2);
      expect(props, [tIso6391, tName]);
    });
  });
}
