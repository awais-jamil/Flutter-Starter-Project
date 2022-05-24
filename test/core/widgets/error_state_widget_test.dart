import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/core/widgets/error_state_widget.dart';
import 'package:mobile_app/utills/common_barrel.dart';

void main() {
  testWidgets(
    'ErrorStateWidget Widget isEmpty true',
    (tester) async {
      await tester.pumpWidget(
        const Material(child: ErrorStateWidget()),
      );

      final imageAsset = find.byType(Image);

      expect(imageAsset, findsOneWidget);
    },
  );
}
