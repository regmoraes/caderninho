import 'package:caderninho/theme/colors.dart';
import 'package:caderninho/theme/theme.dart';
import 'package:caderninho/theme/text_theme.dart';
import 'package:flutter/material.dart';

abstract class InputTheme {
  /*
   * The use of multiple additional border props is necessary due to an issue
   * that's not fixed yet.
   *
   * Issue: https://github.com/flutter/flutter/issues/17592
   */
  static final InputDecorationTheme primary = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: error[Shades.primary],
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: error[Shades.primary],
      ),
    ),
    errorStyle: caderninhoTextTheme.caption.copyWith(
      color: error[Shades.primary],
    ),
    contentPadding: const EdgeInsets.all(16.0),
    isCollapsed: true,
  );
}
