import 'package:flutter/painting.dart';

enum Shades {
  primary,
  secondary,
  accent,
  light,
  lightest,
  dark,
  darkest,
  alpha
}

const Map<Shades, Color> primary = {
  Shades.primary: const Color(0xFF001BB8),
  Shades.light: const Color(0xFF7F8CDB),
  Shades.dark: const Color(0xFF000E9E),
  Shades.alpha: const Color(0x14001BB8),
};

const Map<Shades, Color> secondary = {
  Shades.primary: const Color(0xFF03D8A9),
  Shades.light: const Color(0xFF9AEFDC),
  Shades.dark: const Color(0xFF00B670),
  Shades.alpha: const Color(0x1403D8A9),
};

const Map<Shades, Color> tertiary = {
  Shades.primary: const Color(0xFF07074E),
  Shades.light: const Color(0xFF8282A6),
  Shades.dark: const Color(0xFF030333),
  Shades.alpha: const Color(0x1407074E),
};

const Map<Shades, Color> error = {
  Shades.primary: const Color(0xFFE74C3C),
  Shades.light: const Color(0xFFF5B7B1),
  Shades.dark: const Color(0xFFD1160E),
  Shades.alpha: const Color(0x14E74C3C),
};

const Map<Shades, Color> warning = {
  Shades.primary: const Color(0xFFF08C00),
  Shades.light: const Color(0xFFF9D199),
  Shades.dark: const Color(0xFFE14C00),
  Shades.alpha: const Color(0x14F08C00),
};
