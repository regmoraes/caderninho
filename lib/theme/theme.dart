import 'package:caderninho/theme/button_theme.dart';
import 'package:caderninho/theme/card_theme.dart';
import 'package:caderninho/theme/colors.dart';
import 'package:caderninho/theme/text_theme.dart';
import 'package:flutter/material.dart';

final ThemeData caderninhoTheme = ThemeData(
  primaryColor: tertiary[Shades.primary],
  primaryColorDark: tertiary[Shades.dark],
  primaryColorLight: tertiary[Shades.light],
  accentColor: secondary[Shades.primary],
  backgroundColor: Colors.white,
  errorColor: error[Shades.primary],
  inputDecorationTheme: InputDecorationTheme(),
  fontFamily: 'Roboto',
  textTheme: caderninhoTextTheme,
  elevatedButtonTheme: caderninhoElevatedButtonTheme,
  outlinedButtonTheme: caderninhoOutlinedButtonTheme,
  cardTheme: caderninhoCardTheme,
  buttonTheme: ButtonThemeData(
    buttonColor: primary[Shades.primary],
    disabledColor: primary[Shades.alpha],
    textTheme: ButtonTextTheme.primary,
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
  ),
);
