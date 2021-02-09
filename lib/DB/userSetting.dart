import 'package:flutter/material.dart';

class UserSetting {
  UserTheme theme;
  String font;

  UserSetting({this.theme, this.font});

  UserSetting.fromJson(Map<dynamic, dynamic> json) {
    theme = json['theme'] != null ? UserTheme.fromJson(json['theme']) : null;
    font = json['font'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['theme'] = this.theme.toJson();
    data['font'] = this.font;
    return data;
  }

  @override
  String toString() {
    return 'UserSetting{theme: ${theme.toString()}, font: $font}';
  }

}

class UserTheme {
  String themeName;
  List<String> pocketColor;

  UserTheme({this.themeName, this.pocketColor});

  UserTheme.fromJson(Map<String, dynamic> json) {
    themeName = json['themeName'];
    pocketColor =  json['pocketColor']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['themeName'] = this.themeName;
    data['pocketColor'] = this.pocketColor;
    return data;
  }

  @override
  String toString() {
    return 'UserSetting{theme: $themeName, font: $pocketColor}';
  }
}