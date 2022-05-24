import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/core/widgets/buttons.dart';
import 'package:mobile_app/utills/common_barrel.dart';

void main() {
  group('FilledButton', () {
    testWidgets('find text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: FilledButton(title: Text('Testing')),
        ),
      );

      final widget = find.text('Testing');

      expect(widget, findsOneWidget);
    });

    testWidgets('find loader', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: FilledButton(
            title: Text('Testing'),
            buttonState: ButtonState.loading,
          ),
        ),
      );

      final widget = find.byType(CircularProgressIndicator);

      expect(widget, findsOneWidget);
    });

    testWidgets('tap', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: FilledButton(
            title: const Text('Testing'),
            onPressed: () {},
          ),
        ),
      );

      final widget = find.byType(FilledButton);

      await tester.tap(widget);

      await tester.pump();

      final widgetAfterTap = find.byType(FilledButton);

      expect(widgetAfterTap, findsOneWidget);
    });
  });

  group('BorderButton', () {
    testWidgets('find text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BorderButton(title: Text('Testing')),
        ),
      );

      final widget = find.text('Testing');

      expect(widget, findsOneWidget);
    });

    testWidgets('find loader', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BorderButton(
            title: Text('Testing'),
            buttonState: ButtonState.loading,
          ),
        ),
      );

      final widget = find.byType(CircularProgressIndicator);

      expect(widget, findsOneWidget);
    });

    testWidgets('tap', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BorderButton(
            title: const Text('Testing'),
            onPressed: () {},
          ),
        ),
      );

      final widget = find.byType(BorderButton);

      await tester.tap(widget);

      await tester.pump();

      final widgetAfterTap = find.byType(BorderButton);

      expect(widgetAfterTap, findsOneWidget);
    });
  });
  group('TxtButton', () {
    testWidgets('find text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TxtButton(title: Text('Testing')),
        ),
      );

      final widget = find.text('Testing');

      expect(widget, findsOneWidget);
    });

    testWidgets('tap', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TxtButton(
            title: const Text('Testing'),
            onPressed: () {},
          ),
        ),
      );

      final widget = find.byType(TxtButton);

      await tester.tap(widget);

      await tester.pump();

      final widgetAfterTap = find.byType(TxtButton);

      expect(widgetAfterTap, findsOneWidget);
    });
  });
}
