import 'package:flutter/material.dart';
import 'package:mobile_app/utills/asset.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    Key? key,
    required this.child,
    required this.isEmpty,
  }) : super(key: key);

  final Widget child;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Align(
            child: SizedBox(
              width: 100,
              child: Image.asset(Asset.logo),
            ),
          )
        : child;
  }
}
