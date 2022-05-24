import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

PackageInfo? _packageInfo;
Future<PackageInfo> getPackageInfo() async {
  _packageInfo ??= await PackageInfo.fromPlatform();
  return _packageInfo!;
}

extension DateTimeX on DateTime {
  String date([String? locale]) =>
      DateFormat('MMM dd, yyyy', locale).format(this);

  String get languageCode => timeZoneName == 'KST' ? 'ko' : 'en';

  String mmmYy([String? locale]) {
    final dateTime = DateFormat('MMM dd, yyyy', locale).format(this);

    return "${dateTime.substring(0, 3)} '${year - 2000}"; // Jan '22
  }
}

Color? color(BuildContext context) =>
    Theme.of(context).textTheme.headline5!.color;
