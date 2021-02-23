import 'package:caderninho/theme/colors.dart';
import 'package:caderninho/theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

final caderninhoElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    primary: primary[Shades.primary],
    onSurface: primary[Shades.light],
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  ),
);

final caderninhoTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(textStyle: caderninhoTextTheme.headline2),
);

final caderninhoOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    primary: primary[Shades.primary],
    onSurface: primary[Shades.alpha],
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  ),
);
