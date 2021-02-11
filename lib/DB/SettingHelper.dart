import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_moonhwadiary/DB/userSetting.dart';
import 'package:project_moonhwadiary/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:project_moonhwadiary/widget/theme.dart';

class SettingHelper {
  SettingHelper._();

  static final SettingHelper _setting = SettingHelper._();

  factory SettingHelper() => _setting;
  static UserTheme _userTheme;

  Future<UserTheme> get setting async {
    if (_userTheme != null) return _userTheme;

    _userTheme = await getSettingValues();
    return _userTheme;
  }

  // json 으로 저장하기
  Future<void> saveSettingValues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool result = await prefs.setString('userSetting', jsonEncode(_userTheme));
    print("change : $result");
    print("now user_setting : " + _userTheme.toString());
  }

  // json 정보 가져오기 UserSetting class 정보로 가져옴
  Future<UserTheme> getSettingValues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap;
    final String userStr = prefs.getString('userSetting');
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
    }

    if (userMap != null) {
      final UserTheme user = UserTheme.fromJson(userMap);
      _userTheme = user;
      print("get user_setting : " + _userTheme.toString());
      return user;
    }
    return null;
  }

  Future<ThemeData> getTheme() async{
    final userTheme = await setting;
    return userTheme.themeData;
  }
/*
  void changeTheme(String themeName, BuildContext context) {
    switch (themeName) {
      case "pink":
        _userTheme.themeData = pinkTheme;
        _userTheme.pocketColor = pinkPocketColors;
        break;
      case "purple":
        _userTheme.themeData = pinkTheme;
        _userTheme.pocketColor = pinkPocketColors;
        break;
      case "sky":
        _userTheme.themeData = pinkTheme;
        _userTheme.pocketColor = pinkPocketColors;
        break;
      case "mint":
        _userTheme.themeData = pinkTheme;
        _userTheme.pocketColor = pinkPocketColors;
        break;
      case "yellow":
        _userTheme.themeData = pinkTheme;
        _userTheme.pocketColor = pinkPocketColors;
        break;
      case "olive":
        _userTheme.themeData = pinkTheme;
        _userTheme.pocketColor = pinkPocketColors;
        break;
    }
  }
*/
  void changeFont(BuildContext context, String fontName) {
    MyApp.of(context).fontName = fontName;
  }
}
