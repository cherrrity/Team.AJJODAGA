import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// provides the currently selected theme, saves changed theme preferences to disk
class ThemeController extends ChangeNotifier {
  static const themePrefKey = 'theme';
  static const fontPrefKey = 'font';

  ThemeController(this._prefs) {
    // load theme from preferences on initialization
    _currentTheme = _prefs.getString(themePrefKey) ?? 'pink';
    _currentFont = _prefs.getString(fontPrefKey) ?? 'NanumGothic';

    print(_currentTheme+" / "+_currentFont);
  }

  final SharedPreferences _prefs;
  String _currentTheme;
  String _currentFont;

  /// get the current theme
  String get currentTheme => _currentTheme;
  String get currentFont => _currentFont;

  void setTheme(String theme) {
    _currentTheme = theme;

    // notify the app that the theme was changed
    notifyListeners();

    // store updated theme on disk
    _prefs.setString(themePrefKey, theme);
  }

  void setFont(String font){
    _currentFont = font;

    notifyListeners();

    _prefs.setString(fontPrefKey, font);
  }

  /// get the controller from any page of your app
  static ThemeController of(BuildContext context) {
    final provider = context.inheritFromWidgetOfExactType(ThemeControllerProvider) as ThemeControllerProvider;
    return provider.controller;
  }
}

/// provides the theme controller to any page of your app
class ThemeControllerProvider extends InheritedWidget {
  const ThemeControllerProvider({Key key, this.controller, Widget child}) : super(key: key, child: child);

  final ThemeController controller;

  @override
  bool updateShouldNotify(ThemeControllerProvider old) => controller != old.controller;
}