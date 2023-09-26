import 'package:flutter_test/flutter_test.dart';

import '../../mocks.dart';

void main() {
  group('MoviesException | ', () {
    group('fromMap - ', () {
      test('should return a MoviesException when statusCode is 501 - ', () {
        // arrange
        final map = <String, dynamic>{};
        // act
        final result = MoviesException.fromMap(map, 501);
        // assert
        expect(result, isA<MoviesException>());
        expect(result.toString(), 'MoviesException: , true, 501, 10');
      });

      test('should return a FetchDataException when statusCode is 500 - ', () {
        // arrange
        final map = <String, dynamic>{};
        // act
        final result = MoviesException.fromMap(map, 500);
        // assert
        expect(result, isA<FetchDataException>());
        expect(result.toString(), 'MoviesException: , true, 500, 10');
      });

      test('should return a InvalidInputException when statusCode is 400 - ', () {
        // arrange
        final map = <String, dynamic>{};
        // act
        final result = MoviesException.fromMap(map, 400);
        // assert
        expect(result, isA<InvalidInputException>());
        expect(result.toString(), 'MoviesException: , true, 400, 10');
      });

      test('should return a UnauthorisedException when statusCode is 401 - ', () {
        // arrange
        final map = <String, dynamic>{};
        // act
        final result = MoviesException.fromMap(map, 401);
        // assert
        expect(result, isA<UnauthorisedException>());
        expect(result.toString(), 'MoviesException: , true, 401, 10');
      });

      test('should return a NotFoundException when statusCode is 404 - ', () {
        // arrange
        final map = <String, dynamic>{};
        // act
        final result = MoviesException.fromMap(map, 404);
        // assert
        expect(result, isA<NotFoundException>());
        expect(result.toString(), 'MoviesException: , true, 404, 10');
      });
    });

    group('from - ', () {
      test('should return a MoviesException when statusCode is 501 - ', () {
        // arrange
        // act
        final result = MoviesException.from();
        // assert
        expect(result, isA<MoviesException>());
      });

      test('should return a FetchDataException when statusCode is 500 - ', () {
        // arrange
        // act
        final result = MoviesException.from(realStatusCode: 500);
        // assert
        expect(result, isA<FetchDataException>());
      });

      test('should return a InvalidInputException when statusCode is 400 - ', () {
        // arrange
        // act
        final result = MoviesException.from(realStatusCode: 400);
        // assert
        expect(result, isA<InvalidInputException>());
      });

      test('should return a UnauthorisedException when statusCode is 401 - ', () {
        // arrange
        // act
        final result = MoviesException.from(realStatusCode: 401);
        // assert
        expect(result, isA<UnauthorisedException>());
      });

      test('should return a NotFoundException when statusCode is 404 - ', () {
        // arrange
        // act
        final result = MoviesException.from(realStatusCode: 404);
        // assert
        expect(result, isA<NotFoundException>());
      });
    });
  });
}
