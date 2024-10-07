import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/style/colors.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColos.scaffoldDarkBackgraundColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColos.scaffoldBackgraundColor,
      fontFamily: "SSTArabic-Bold",
      fontSize: 20.0,
    ),
    iconTheme: IconThemeData(
      color: AppColos.scaffoldBackgraundColor,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColos.scaffoldBackgraundColor,
    ),
  ),
  scaffoldBackgroundColor: AppColos.scaffoldDarkBackgraundColor,
);

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColos.scaffoldBackgraundColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColos.scaffoldDarkBackgraundColor,
      fontFamily: "SSTArabic-Bold",
      fontSize: 20.0,
    ),
    iconTheme: IconThemeData(
      color: AppColos.scaffoldDarkBackgraundColor,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColos.scaffoldDarkBackgraundColor,
    ),
  ),
  scaffoldBackgroundColor: AppColos.scaffoldBackgraundColor,
);
