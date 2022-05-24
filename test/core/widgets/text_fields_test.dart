import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/core/widgets/text_fields.dart';

void main() {
  group('TextFieldWithoutLabel', () {
    testWidgets(
      'Instantiation',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Material(child: TextFieldWithoutLabel(hint: 'hint')),
          ),
        );

        final field = find.text('hint');

        expect(field, findsOneWidget);
      },
    );
  });

  group('TextFieldWithLabel', () {
    testWidgets(
      'Instantiation',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Material(
              child: TextFieldWithLabel(
                hint: 'hint',
                label: 'label',
              ),
            ),
          ),
        );

        final field = find.text('label');

        expect(field, findsOneWidget);
      },
    );
  });

  group('PasswordTextFieldWithLabel', () {
    testWidgets(
      'Instantiation',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Material(
              child: PasswordTextFieldWithLabel(
                hint: 'hint',
                label: 'label',
              ),
            ),
          ),
        );

        final field = find.text('label');

        expect(field, findsOneWidget);
      },
    );

    testWidgets(
      'password icon change on Icon tap',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Material(
              child: PasswordTextFieldWithLabel(
                hint: 'hint',
                label: 'label',
              ),
            ),
          ),
        );

        final field = find.text('label');

        expect(find.byIcon(Icons.visibility), findsOneWidget);

        await tester.tap(field);
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.visibility));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.visibility), findsNothing);
        expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      },
    );
  });
}
