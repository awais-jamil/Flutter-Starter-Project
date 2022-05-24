import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/core/widgets/empty_state_widget.dart';
import 'package:mobile_app/utills/common_barrel.dart';

void main() {
  testWidgets(
    'EmptyState Widget isEmpty true',
    (tester) async {
      await tester.pumpWidget(
        Material(
          child: EmptyStateWidget(
            isEmpty: true,
            child: Container(),
          ),
        ),
      );

      final imageAsset = find.byType(Image);
      final container = find.byType(Container);

      expect(imageAsset, findsOneWidget);
      expect(container, findsNothing);
    },
  );

  testWidgets(
    'EmptyState Widget isEmpty false',
    (tester) async {
      await tester.pumpWidget(
        Material(
          child: EmptyStateWidget(
            isEmpty: false,
            child: Container(),
          ),
        ),
      );

      final imageAsset = find.byType(Image);
      final container = find.byType(Container);

      expect(imageAsset, findsNothing);
      expect(container, findsOneWidget);
    },
  );
}
