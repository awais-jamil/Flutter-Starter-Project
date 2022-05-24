import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/core/services/api_state.dart';
import 'package:mobile_app/core/widgets/api_state_widget.dart';
import 'package:mobile_app/core/widgets/empty_state_widget.dart';
import 'package:mobile_app/core/widgets/error_state_widget.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  testWidgets('Find empty Widget', (tester) async {
    await tester.pumpWidget(
      Material(
        child: ApiStateWidget(
          isEmpty: true,
          loadingWidget: Container(),
          apiState: null,
          child: Container(),
        ),
      ),
    );

    final widget = find.byType(EmptyStateWidget);

    expect(widget, findsOneWidget);
  });

  testWidgets('Find Shimmer', (tester) async {
    await tester.pumpWidget(
      Material(
        child: ApiStateWidget(
          isEmpty: true,
          loadingWidget: Container(),
          apiState: ApiLoadingState(),
          child: Container(),
        ),
      ),
    );

    final widget = find.byType(Shimmer);

    expect(widget, findsOneWidget);
  });

  testWidgets('Find ErrorWidget', (tester) async {
    await tester.pumpWidget(
      Material(
        child: ApiStateWidget(
          isEmpty: true,
          loadingWidget: Container(),
          apiState: ApiErrorState(type: ErrorType.authentication),
          child: Container(),
        ),
      ),
    );

    final widget = find.byType(ErrorStateWidget);

    expect(widget, findsOneWidget);
  });
}
