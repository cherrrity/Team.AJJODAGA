import 'dart:ui';
import 'package:flutter/material.dart';

/// ----  Pink(default) Theme  ----
final pinkCardBackground    = Color(0xFFFDF5F5);
final pinkBackground    = Color(0xFFFFDBDB);
final pinkAccent        = Color(0xFFFEC4C4);
final pinkShadow        = Color(0xFFD8A7A7);
final pinkTitle         = Color(0xff974949);

final pinkPocketBack1   = Color(0xffE68383);
final pinkPocketBack2   = Color(0xffFF7272);
final pinkPocketBack3   = Color(0xffFEC4C4);

final List<List<Color>> pinkPocketColors = [
  [Color(0xFFFFE8E8), Color(0xffFFD1D1)],
  [Color(0xFFFDD7D7), Color(0xffFFB2B2)],
  [Color(0xffFCAFAF), Color(0xFFFE9393)],
  [Color(0xffFB8888), Color(0xFFFE6E6E)],
  [Color(0xffFE7474), Color(0xffF95353)],
];

ThemeData pinkTheme(String font) => ThemeData(
    fontFamily: font,
    scaffoldBackgroundColor: pinkBackground,
    backgroundColor: pinkAccent,
    accentColor: pinkShadow,
    highlightColor: pinkCardBackground,
    primaryColor: pinkPocketBack1,
    cardColor: pinkPocketBack2,
    canvasColor: pinkPocketBack3,
    textSelectionColor: pinkTitle,
);

/// ----  purple Theme  ----
final purpleCardBackground = Color(0xFFf8f5fd);
final purpleBackground    = Color(0xFFE8DEFB);
final purpleAccent        = Color(0xFFD9C8F8);
final purpleShadow        = Color(0xffBAA7D9);
final purpleTitle         = Color(0xff735BA0);

final purplePocketBack1   = Color(0xFFCBB5F4);
final purplePocketBack2   = Color(0xffA780F1);
final purplePocketBack3   = Color(0xffBAA7D9);

// 그라데이션 미적용 오른쪽 컬러 변경 필요
final List<List<Color>> purplePocketColors = [
  [Color(0xffEFE8FC), Color(0xffE3D6FB)],
  [Color(0xffE5D9F9), Color(0xffCEB9F7)],
  [Color(0xFFCBB5F4), Color(0xFFBB9DF4)],
  [Color(0xFFB392F0), Color(0xFFA57BF0)],
  [Color(0xffA780F1), Color(0xff9162E9)]
];

ThemeData purpleTheme(String font) => ThemeData(
  fontFamily: font,
  scaffoldBackgroundColor: purpleBackground,
  backgroundColor: purpleAccent,
  accentColor: purpleShadow,
  highlightColor: purpleCardBackground,
  primaryColor: purplePocketBack1,
  cardColor: purplePocketBack2,
  canvasColor: purplePocketBack3,
  textSelectionColor: purpleTitle,
);

/// ----  sky Theme  ----
final skyCardBackground = Color(0xFFf5fbfd);
final skyBackground    = Color(0xFFE2EDFC);
final skyAccent        = Color(0xFFCEDFF9);
final skyShadow        = Color(0xFF9BB2D5);
final skyTitle         = Color(0xff6D86AB);

final skyPocketBack1   = Color(0xFFBED5F6);
final skyPocketBack2   = Color(0xff8EB9F3);
final skyPocketBack3   = Color(0xFF9BB2D5);

// 그라데이션 미적용 오른쪽 컬러 변경 필요
final List<List<Color>> skyPocketColors = [
  [Color(0xffECF3FD), Color(0xffD9E7FB)],
  [Color(0xffDEE9FA), Color(0xffC1D7F8)],
  [Color(0xFFBED6F6), Color(0xFFA8C8F5)],
  [Color(0xFF9FC1F2), Color(0xFF8AB5F2)],
  [Color(0xff8FB9F3), Color(0xff74A6ED)]
];

ThemeData skyTheme(String font) => ThemeData(
  fontFamily: font,
  scaffoldBackgroundColor: skyBackground,
  backgroundColor: skyAccent,
  accentColor: skyShadow,
  highlightColor: skyCardBackground,
  primaryColor: skyPocketBack1,
  cardColor: skyPocketBack2,
  canvasColor: skyPocketBack3,
  textSelectionColor: skyTitle,
);

/// ----  mint Theme  ----
final mintCardBackground = Color(0xFFf6fdf5);
final mintBackground    = Color(0xffE2F7F3);
final mintAccent        = Color(0xffCFF1EB);
final mintShadow        = Color(0xFFA1C4BE);
final mintTitle         = Color(0xff65968E);

final mintPocketBack1   = Color(0xffDCF4F0);
final mintPocketBack2   = Color(0xff8EE0D2);
final mintPocketBack3   = Color(0xFFA1C4BE);

// 그라데이션 미적용 오른쪽 컬러 변경 필요
final List<List<Color>> mintPocketColors = [
  [Color(0xffECFAF8), Color(0xffECFAF8)],
  [Color(0xffDEF5F1), Color(0xffC2EEE7)],
  [Color(0xFFBFECE4), Color(0xFFA9E7DD)],
  [Color(0xFFA0E3D8), Color(0xFF8CE0D2)],
  [Color(0xff91E1D4), Color(0xff75D6C6)]
];

ThemeData mintTheme(String font) => ThemeData(
  fontFamily: font,
  scaffoldBackgroundColor: mintBackground,
  backgroundColor: mintAccent,
  accentColor: mintShadow,
  highlightColor: mintCardBackground,
  primaryColor: mintPocketBack1,
  cardColor: mintPocketBack2,
  canvasColor: mintPocketBack3,
  textSelectionColor: mintTitle,
);

/// ----  yellow Theme  ----
final yellowCardBackground = Color(0xFFfdfcf5);
final yellowBackground    = Color(0xffFFF5DA);
final yellowAccent        = Color(0xffFEEDC2);
final yellowShadow        = Color(0xFFD1BD8A);
final yellowTitle         = Color(0xffA99051);

final yellowPocketBack1   = Color(0xffFDF1D4);
final yellowPocketBack2   = Color(0xffFFD773);
final yellowPocketBack3   = Color(0xFFD1BD8A);

// 그라데이션 미적용 오른쪽 컬러 변경 필요
final List<List<Color>> yellowPocketColors = [
  [Color(0xffFEF8E6), Color(0xffFFF2D0)],
  [Color(0xffFDF1D4), Color(0xffFFE9B1)],
  [Color(0xFFFDE6AD), Color(0xFFFFE092)],
  [Color(0xFFFCDB86), Color(0xFFFFD56C)],
  [Color(0xffFFD773), Color(0xffFBCA4F)]
];

ThemeData yellowTheme(String font) => ThemeData(
  fontFamily: font,
  scaffoldBackgroundColor: yellowBackground,
  backgroundColor: yellowAccent,
  accentColor: yellowShadow,
  highlightColor: yellowCardBackground,
  primaryColor: yellowPocketBack1,
  cardColor: yellowPocketBack2,
  canvasColor: yellowPocketBack3,
  textSelectionColor: yellowTitle,
);

/// ----  olive Theme  ----
final oliveCardBackground = Color(0xFFf6fdf5);
final oliveBackground    = Color(0xffE8F3E7);
final oliveAccent        = Color(0xffD8EAD6);
final oliveShadow        = Color(0xFF9BC397);
final oliveTitle         = Color(0xff708A6E);

final olivePocketBack1   = Color(0xffE2EFE1);
final olivePocketBack2   = Color(0xffA5CFA1);
final olivePocketBack3   = Color(0xFF9BC397);

// 그라데이션 미적용 오른쪽 컬러 변경 필요
final List<List<Color>> olivePocketColors = [
  [Color(0xffF0F7EF), Color(0xffE1EFE0)],
  [Color(0xffE4F0E3), Color(0xffCDE4CB)],
  [Color(0xFFCAE2C8), Color(0xFFB9DAB6)],
  [Color(0xFFB1D4AE), Color(0xFFA2CE9E)],
  [Color(0xffA6D0A2), Color(0xff8FC18A)]
];

ThemeData oliveTheme(String font) => ThemeData(
  fontFamily: font,
  scaffoldBackgroundColor: oliveBackground,
  backgroundColor: oliveAccent,
  accentColor: oliveShadow,
  highlightColor: oliveCardBackground,
  primaryColor: olivePocketBack1,
  cardColor: olivePocketBack2,
  canvasColor: olivePocketBack3,
  textSelectionColor: oliveTitle,
);