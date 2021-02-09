import 'dart:ui';
import 'package:flutter/material.dart';

/// ----  Pink(default) Theme  ----
final pinkBackground    = Color(0xFFFFDBDB);
final pinkAccent        = Color(0xFFFEC4C4);
final pinkShadow        = Color(0xFFFEC4C4);
final pinkPocketColors = [
  Color(0xFFFFE8E8), Color(0xffFFD1D1),
  Color(0xFFFDD7D7), Color(0xffFFB2B2),
  Color(0xffFFB2B2), Color(0xFFFCB0B0),
  Color(0xffFF9393), Color(0xFFFB8989),
  Color(0xffFF7575), Color(0xffF95353)
];

final pinkTheme = ThemeData(
    primaryColor: pinkBackground,
    accentColor: pinkAccent,
    shadowColor: pinkAccent,
    backgroundColor: pinkBackground
);
