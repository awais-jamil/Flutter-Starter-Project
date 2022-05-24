import 'package:flutter/material.dart';
import 'package:mobile_app/utills/asset.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        child: Container(
          width: 100,
          padding: const EdgeInsets.all(8),
          child: Image.asset(Asset.logo),
        ),
      );
}
