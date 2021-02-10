import 'package:flutter/material.dart';


// 화면 import
import 'package:project_moonhwadiary/main.dart';
import 'package:project_moonhwadiary/views/card_view.dart';
import 'package:project_moonhwadiary/views/card_write_view.dart';
import 'package:project_moonhwadiary/views/splash_view.dart';

import 'package:project_moonhwadiary/views/settings.dart';
import 'package:project_moonhwadiary/views/theme.dart';
import 'package:project_moonhwadiary/views/font.dart';

class Routes {
  Routes._();

  static final routes = {
    //'/' : (BuildContext context) => MySplashScreen(),
    '/' : (BuildContext context) => MyHomePage(),
    '/card': (BuildContext context) => ViewCardPage(),
    '/write_card' : (BuildContext context) => WriteCardPage(),
    '/setting': (BuildContext context) => Settings(),
    '/setting_font' : (BuildContext context) => Font(),
    '/setting_theme' : (BuildContext context) => ThemeColor(),
  };
}