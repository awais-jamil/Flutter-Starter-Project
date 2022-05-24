import 'package:flutter/material.dart';
import 'package:mobile_app/core/services/api_state.dart';
import 'package:mobile_app/core/widgets/empty_state_widget.dart';
import 'package:mobile_app/core/widgets/error_state_widget.dart';
import 'package:mobile_app/utills/common_barrel.dart';
import 'package:shimmer/shimmer.dart';

class ApiStateWidget extends StatelessWidget {
  const ApiStateWidget({
    Key? key,
    required this.child,
    required this.isEmpty,
    required this.loadingWidget,
    required this.apiState,
  }) : super(key: key);

  final Widget child;
  final Widget loadingWidget;
  final bool isEmpty;
  final ApiState? apiState;

  @override
  Widget build(BuildContext context) {
    if (apiState is ApiLoadingState) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).highlightColor,
        highlightColor: Theme.of(context).highlightColor.withOpacity(0.2),
        child: loadingWidget,
      );
    } else if (apiState is ApiErrorState) {
      return const ErrorStateWidget();
    } else {
      return EmptyStateWidget(
        isEmpty: isEmpty,
        child: child,
      );
    }
  }
}
