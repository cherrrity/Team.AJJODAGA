import 'package:flutter/material.dart';

class UserTheme {
  String themeName;
  ThemeData themeData;
  List<String> pocketColor;

  UserTheme({this.themeName, this.themeData, this.pocketColor});

  UserTheme.fromJson(Map<String, dynamic> json) {
    themeName = json['themeName'];
    themeData = json['themeData'];
    pocketColor =  json['pocketColor']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['themeName'] = this.themeName;
    data['themeData'] = this.themeData;
    data['pocketColor'] = this.pocketColor;
    return data;
  }

  @override
  String toString() {
    return 'UserSetting{theme: $themeName, themeName: $themeName, themeData: $themeData font: $pocketColor}';
  }
}