import 'package:caderninho/theme/colors.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

final caderninhoTextTheme = TextTheme(
  headline1: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  headline2: TextStyle(
    fontSize: 18,
    color: Colors.black,
  ),
  headline3: TextStyle(
    fontSize: 16,
    color: Colors.black,
  ),
  headline4: TextStyle(
    color: Colors.black,
    fontSize: 40,
    fontWeight: FontWeight.w700,
  ),
  bodyText1: TextStyle(
    fontSize: 14,
    color: Colors.grey,
  ),
  subtitle2: TextStyle(
    fontSize: 14,
    color: Colors.grey,
  ),
  caption: TextStyle(
    fontSize: 12,
    color: Colors.grey,
  ),
  button: TextStyle(fontSize: 14.0),
);

final caderninhoErrorTextStyle = TextStyle(
  color: error[Shades.primary],
);
