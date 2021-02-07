import 'package:flutter/material.dart';


// 화면 import
import 'package:project_moonhwadiary/main.dart';
import 'package:project_moonhwadiary/views/card_view.dart';
import 'package:project_moonhwadiary/views/card_write_view.dart';
import 'package:project_moonhwadiary/views/splash_view.dart';

class Routes {
  Routes._();

  static final routes = {
    //'/' : (BuildContext context) => MySplashScreen(),
    '/' : (BuildContext context) => MyHomePage(),
    '/card': (BuildContext context) => ViewCardPage(),
    '/write_card' : (BuildContext context) => WriteCardPage(),
  };
}