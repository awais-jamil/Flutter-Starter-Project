import 'package:flutter/services.dart';
import 'package:mobile_app/core/configuration/theme/base_theme.dart';
import 'package:mobile_app/utills/app_colors.dart';
import 'package:mobile_app/utills/app_fonts.dart';
import 'package:mobile_app/utills/common_barrel.dart';
import 'package:mobile_app/utills/constants.dart';

class DarkTheme extends BaseTheme {
  @override
  AppBarTheme get appBarTheme => const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      );

  @override
  ButtonThemeData get buttonTheme => const ButtonThemeData();

  @override
  CardTheme get cardTheme => CardTheme(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.radius),
        ),
      );

  @override
  ColorScheme get colorScheme => ColorScheme.dark(
        primary: AppColors.purpleColors.first,
        secondary: AppColors.purpleColors[2],
        error: AppColors.redColors.first,
      );

  @override
  DividerThemeData get dividerTheme =>
      const DividerThemeData(thickness: 0.5, color: Colors.grey);

  @override
  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.radius),
          ),
        ),
      );

  @override
  IconThemeData get iconTheme =>
      IconThemeData(color: AppColors.greyColors.last);

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.purpleColors[3]),
        ),
      );

  @override
  ListTileThemeData get listTileTheme => ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.radius),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        selectedColor: AppColors.purpleColors[3],
      );

  @override
  TextTheme get textTheme => TextTheme(
        headline1: AppFonts.headline1.copyWith(color: Colors.white),
        headline2: AppFonts.headline2.copyWith(color: Colors.white),
        headline3: AppFonts.headline3.copyWith(color: Colors.white),
        headline4: AppFonts.headline4.copyWith(color: Colors.white),
        bodyText1: AppFonts.bodyText1.copyWith(color: Colors.white),
        bodyText2: AppFonts.bodyText2.copyWith(color: Colors.white),
      );

  @override
  OutlinedButtonThemeData get outlinedButtonThemeData =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          fixedSize: const Size.fromHeight(55),
          side: BorderSide(
            color: AppColors.purpleColors.first,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.radius),
          ),
        ),
      );

  @override
  ProgressIndicatorThemeData get progressIndicatorTheme =>
      ProgressIndicatorThemeData(color: AppColors.greyColors.last);

  @override
  DialogTheme get dialogTheme =>
      DialogTheme(backgroundColor: AppColors.greyColors.first);

  @override
  Color? get scaffoldBackgroundColor => null;

  @override
  TextStyle get primaryAndDarkStyle => TextStyle(
        color: AppColors.greyColors.last,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
}
