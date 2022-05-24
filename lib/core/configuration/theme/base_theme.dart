import 'package:flutter/material.dart';

abstract class BaseTheme {
  AppBarTheme get appBarTheme;
  ButtonThemeData get buttonTheme;
  ElevatedButtonThemeData get elevatedButtonTheme;
  OutlinedButtonThemeData get outlinedButtonThemeData;
  TextTheme get textTheme;
  IconThemeData get iconTheme;
  ColorScheme get colorScheme;
  DividerThemeData get dividerTheme;
  CardTheme get cardTheme;
  InputDecorationTheme get inputDecorationTheme;
  ListTileThemeData get listTileTheme;
  ProgressIndicatorThemeData get progressIndicatorTheme;
  DialogTheme get dialogTheme;
  Color? get scaffoldBackgroundColor;
  TextStyle get primaryAndDarkStyle;

  ThemeData get themeData => ThemeData(
        dialogTheme: dialogTheme,
        progressIndicatorTheme: progressIndicatorTheme,
        appBarTheme: appBarTheme,
        buttonTheme: buttonTheme,
        textTheme: textTheme,
        colorScheme: colorScheme,
        iconTheme: iconTheme,
        dividerTheme: dividerTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        cardTheme: cardTheme,
        inputDecorationTheme: inputDecorationTheme,
        listTileTheme: listTileTheme,
        outlinedButtonTheme: outlinedButtonThemeData,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      );
}
