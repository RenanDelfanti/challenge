import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks.dart';

void main() {
  group('LoadingStatePage | ', () {
    testWidgets('should display loading indicator - ', (tester) async {
      //arrange
      await tester.pumpWidget(const LoadingStatePage());
      //assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
