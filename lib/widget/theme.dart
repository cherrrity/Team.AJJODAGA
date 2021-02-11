import 'dart:ui';
import 'package:flutter/material.dart';

/// ----  Pink(default) Theme  ----
final pinkBackground    = Color(0xFFFFDBDB);
final pinkAccent        = Color(0xFFFEC4C4);
final pinkShadow        = Color(0xFFD8A7A7);

final pinkPocketBack1   = Color(0xffE68383);
final pinkPocketBack2   = Color(0xffFF7272);
final pinkPocketBack3   = Color(0xffFEC4C4);

final List<List<Color>> pinkPocketColors = [
  [Color(0xFFFFE8E8), Color(0xffFFD1D1)],
  [Color(0xFFFDD7D7), Color(0xffFFB2B2)],
  [Color(0xffFFB2B2), Color(0xFFFCB0B0)],
  [Color(0xffFF9393), Color(0xFFFB8989)],
  [Color(0xffFF7575), Color(0xffF95353)],
];

ThemeData pinkTheme(String font) => ThemeData(
    fontFamily: font,
    scaffoldBackgroundColor: pinkBackground,
    backgroundColor: pinkAccent,
    accentColor: pinkShadow,
    primaryColor: pinkPocketBack1,
    cardColor: pinkPocketBack2,
    canvasColor: pinkPocketBack3,
);

/// ----  purple Theme  ----
final purpleBackground    = Color(0xFFE8DEFB);
final purpleAccent        = Color(0xFFD9C8F8);
final purpleShadow        = Color(0xffBAA7D9);

final purplePocketBack1   = Color(0xFFCBB5F4);
final purplePocketBack2   = Color(0xffA780F1);
final purplePocketBack3   = Color(0xffBAA7D9);

// 그라데이션 미적용 오른쪽 컬러 변경 필요
final List<List<Color>> purplePocketColors = [
  [Color(0xffEFE8FC), Color(0xffEFE8FC)],
  [Color(0xffE5D9F9), Color(0xffE5D9F9)],
  [Color(0xFFCBB5F4), Color(0xFFCBB5F4)],
  [Color(0xFFB392F0), Color(0xFFB392F0)],
  [Color(0xffA780F1), Color(0xffA780F1)]
];

ThemeData purpleTheme(String font) => ThemeData(
  fontFamily: font,
  scaffoldBackgroundColor: purpleBackground,
  backgroundColor: purpleAccent,
  accentColor: purpleShadow,
  primaryColor: purplePocketBack1,
  cardColor: purplePocketBack2,
  canvasColor: purplePocketBack3,
);

/// ----  sky Theme  ----
final skyBackground    = Color(0xFFE2EDFC);
final skyAccent        = Color(0xFFCEDFF9);
final skyShadow        = Color(0xFF9BB2D5);

final skyPocketBack1   = Color(0xFFBED5F6);
final skyPocketBack2   = Color(0xff8EB9F3);
final skyPocketBack3   = Color(0xFF9BB2D5);

// 그라데이션 미적용 오른쪽 컬러 변경 필요
final List<List<Color>> skyPocketColors = [
  [Color(0xffECF3FD), Color(0xffECF3FD)],
  [Color(0xffDCE8FA), Color(0xffDCE8FA)],
  [Color(0xFFBED5F6), Color(0xFFBED5F6)],
  [Color(0xFF9EC0F2), Color(0xFF9EC0F2)],
  [Color(0xff8EB9F3), Color(0xff8EB9F3)]
];

ThemeData skyTheme(String font) => ThemeData(
  fontFamily: font,
  scaffoldBackgroundColor: skyBackground,
  backgroundColor: skyAccent,
  accentColor: skyShadow,
  primaryColor: skyPocketBack1,
  cardColor: skyPocketBack2,
  canvasColor: skyPocketBack3,
);

/// ----  mint Theme  ----
final mintBackground    = Color(0xffE2F7F3);
final mintAccent        = Color(0xffCFF1EB);
final mintShadow        = Color(0xFFA1C4BE);

final mintPocketBack1   = Color(0xffDCF4F0);
final mintPocketBack2   = Color(0xff8EE0D2);
final mintPocketBack3   = Color(0xFFA1C4BE);

// 그라데이션 미적용 오른쪽 컬러 변경 필요
final List<List<Color>> mintPocketColors = [
  [Color(0xffE9F9F6), Color(0xffE9F9F6)],
  [Color(0xffDCF4F0), Color(0xffDCF4F0)],
  [Color(0xFFBDEBE3), Color(0xFFBDEBE3)],
  [Color(0xFF9EE2D7), Color(0xFF9EE2D7)],
  [Color(0xff8EE0D2), Color(0xff8EE0D2)]
];

ThemeData mintTheme(String font) => ThemeData(
  fontFamily: font,
  scaffoldBackgroundColor: mintBackground,
  backgroundColor: mintAccent,
  accentColor: mintShadow,
  primaryColor: mintPocketBack1,
  cardColor: mintPocketBack2,
  canvasColor: mintPocketBack3,
);

/// ----  yellow Theme  ----
final yellowBackground    = Color(0xffFFF5DA);
final yellowAccent        = Color(0xffFEEDC2);
final yellowShadow        = Color(0xFFD1BD8A);

final yellowPocketBack1   = Color(0xffFDF1D4);
final yellowPocketBack2   = Color(0xffFFD773);
final yellowPocketBack3   = Color(0xFFD1BD8A);

// 그라데이션 미적용 오른쪽 컬러 변경 필요
final List<List<Color>> yellowPocketColors = [
  [Color(0xffFFF8E4), Color(0xffFFF8E4)],
  [Color(0xffFDF1D4), Color(0xffFDF1D4)],
  [Color(0xFFFDE6AD), Color(0xFFFDE6AD)],
  [Color(0xFFFDDB85), Color(0xFFFDDB85)],
  [Color(0xffFFD773), Color(0xffFFD773)]
];

ThemeData yellowTheme(String font) => ThemeData(
  fontFamily: font,
  scaffoldBackgroundColor: yellowBackground,
  backgroundColor: yellowAccent,
  accentColor: yellowShadow,
  primaryColor: yellowPocketBack1,
  cardColor: yellowPocketBack2,
  canvasColor: yellowPocketBack3,
);

/// ----  olive Theme  ----
final oliveBackground    = Color(0xffE8F3E7);
final oliveAccent        = Color(0xffD8EAD6);
final oliveShadow        = Color(0xFF9BC397);

final olivePocketBack1   = Color(0xffE2EFE1);
final olivePocketBack2   = Color(0xffA5CFA1);
final olivePocketBack3   = Color(0xFF9BC397);

// 그라데이션 미적용 오른쪽 컬러 변경 필요
final List<List<Color>> olivePocketColors = [
  [Color(0xffEFF6EE), Color(0xffEFF6EE)],
  [Color(0xffE2EFE1), Color(0xffE2EFE1)],
  [Color(0xFFCAE2C8), Color(0xFFCAE2C8)],
  [Color(0xFFB0D4AD), Color(0xFFB0D4AD)],
  [Color(0xffA5CFA1), Color(0xffA5CFA1)]
];

ThemeData oliveTheme(String font) => ThemeData(
  fontFamily: font,
  scaffoldBackgroundColor: oliveBackground,
  backgroundColor: oliveAccent,
  accentColor: oliveShadow,
  primaryColor: pinkPocketBack1,
  cardColor: pinkPocketBack2,
  canvasColor: pinkPocketBack3,
);