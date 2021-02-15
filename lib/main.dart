import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:project_moonhwadiary/DB/ThemeController.dart';
import 'package:project_moonhwadiary/widget/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'dart:convert';

// 라우터
import 'package:project_moonhwadiary/router/routers.dart';

// 모델
import 'package:project_moonhwadiary/models/diary.dart';
import 'package:project_moonhwadiary/widget/pocket.dart';
import 'package:project_moonhwadiary/modules/NeumorphicContainer.dart';
import 'package:project_moonhwadiary/DB/ThemeController.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // load the shared preferences from disk before the app is started
  final prefs = await SharedPreferences.getInstance();

  // create new theme controller, which will get the currently selected from shared preferences
  final themeController = ThemeController(prefs);

  runApp(MyApp(themeController: themeController));
}

class MyApp extends StatefulWidget {
  final ThemeController themeController;

  const MyApp({Key key, this.themeController}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();

  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  ThemeController _themeController;

  String _fontName = 'NanumGothic';
  Color _backColor = Color(0xffFFDBDB);
  Color _btnColor = Color(0xffFEC4C4);
  Color _shadowColor = Color(0xFFD8A7A7);

  set fontName(String value) => setState(() => _fontName = value);
  set backColor(Color value) => setState(() => _backColor = value);
  set btnColor(Color value) => setState(() => _btnColor = value);
  set shadowColor(Color value) => setState(() => _shadowColor = value);

  @override
  Widget build(BuildContext context) {
    _themeController = widget.themeController;

    return AnimatedBuilder(
      animation: _themeController,
      builder: (context, _) {
        // wrap app in inherited widget to provide the ThemeController to all pages
        return ThemeControllerProvider(
          controller: _themeController,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'moonhwaDiary',
            theme: _buildCurrentTheme(),
            routes: Routes.routes,
          ),
        );
      },
    );
  }

  ThemeData _buildCurrentTheme() {
    _fontName = _themeController.currentFont;

    switch (widget.themeController.currentTheme) {
      case "purple":
        return purpleTheme(_fontName);
      case "sky":
        return skyTheme(_fontName);
      case "mint":
        return mintTheme(_fontName);
      case "yellow":
        return yellowTheme(_fontName);
      case "olive":
        return oliveTheme(_fontName);
      case "pink":
      default:
        return pinkTheme(_fontName);
    }
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  DateTime _currentDateTime;

  List<Diary> diaries = [
    Diary(
      dateTime: DateTime(2020, 12, 3),
      feel: 2,
    ),
    Diary(
      dateTime: DateTime(2020, 12, 5),
      feel: 3,
    ),
    Diary(
      dateTime: DateTime(2020, 12, 9),
      feel: 4,
    ),
    Diary(
      dateTime: DateTime(2020, 12, 17),
      feel: 1,
    ),
    Diary(
      dateTime: DateTime(2020, 12, 24),
      feel: 5,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 1),
      feel: 3,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 2),
      feel: 2,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 3),
      feel: 1,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 4),
      feel: 4,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 5),
      feel: 5,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 6),
      feel: 4,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 7),
      feel: 1,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 8),
      feel: 2,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 9),
      feel: 3,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 10),
      feel: 4,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 11),
      feel: 5,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 12),
      feel: 2,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 13),
      feel: 3,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 14),
      feel: 2,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 15),
      feel: 1,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 16),
      feel: 3,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 17),
      feel: 5,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 18),
      feel: 4,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 19),
      feel: 5,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 20),
      feel: 2,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 21),
      feel: 1,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 22),
      feel: 3,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 23),
      feel: 1,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 24),
      feel: 4,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 25),
      feel: 3,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 26),
      feel: 2,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 27),
      feel: 1,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 28),
      feel: 2,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 29),
      feel: 5,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 30),
      feel: 4,
    ),
    Diary(
      dateTime: DateTime(2021, 1, 31),
      feel: 1,
    ),
    Diary(
      dateTime: DateTime(2021, 2, 2),
      feel: 4,
    ),
    Diary(
      dateTime: DateTime(2021, 2, 11),
      feel: 4,
    ),
    Diary(
      dateTime: DateTime(2021, 2, 8),
      feel: 1,
    ),
    Diary(
      dateTime: DateTime(2021, 2, 11),
      feel: 3,
    ),
    Diary(
      dateTime: DateTime(2021, 2, 11),
      feel: 5,
    ),
    Diary(
      dateTime: DateTime(2021, 2, 2),
      feel: 1,
    ),
    Diary(
      dateTime: DateTime(2021, 2, 11),
      feel: 2,
    ),
  ];

  @override
  void initState() {
    super.initState();
    final date = DateTime.now();
    _currentDateTime = DateTime(date.year, date.month);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("main didChange");
  }



  @override
  void dispose() {
    super.dispose();
    print("app 종료");
  }

  void _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        _getNextMonth();
      } else {
        _getPrevMonth();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 설정
            Container(
              height: height * 0.09,
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
              alignment: Alignment.topLeft,
              child: NeumorphicContainer(
                child: GestureDetector(
                  child: Icon(Icons.settings, color: Colors.white),
                  onTap: () => Navigator.pushNamed(context, '/setting'),
                ),
                shape: "iconButton",
              ),
            ),
            Container(
              height: height * 0.78,
              child: SimpleGestureDetector(
                onHorizontalSwipe: _onHorizontalSwipe,
                child: _datesView(),
              ),
            ),
            // 추가
            Container(
              height: height * 0.13,
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 20.0),
              alignment: Alignment.bottomRight,
              child: NeumorphicContainer(
                child: GestureDetector(
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    iconSize: 30.0,
                    onPressed: () =>
                        Navigator.pushNamed(context, '/write_card'),
                  ),
                ),
                shape: "add",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker() {
    DatePicker.showDatePicker(
      context,
      locale: 'en',
      dateFormat: 'yyyy-mm',
      initialDateTime: _currentDateTime,
      onConfirm2: (dateTime, List<int> index) {
        setState(() {
          _currentDateTime = dateTime;
          _datesView();
        });
      },
    );
  }

  Widget _datesView() {
    List<Diary> _currentDiaries = new List<Diary>();
    for (var i = 0; i < diaries.length; i++) {
      if (_currentDateTime.year == diaries[i].dateTime.year &&
          _currentDateTime.month == diaries[i].dateTime.month)
        _currentDiaries.add(diaries[i]);
    }
    _currentDiaries.sort((a, b) => a.dateTime.day.compareTo(b.dateTime.day));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              _toggleBtn(false),
              Expanded(
                child: InkWell(
                  onTap: () => _showPicker(),
                  child: Center(
                    child: Text(
                      '${_currentDateTime.year}년 ${_currentDateTime.month}월',
                      style: TextStyle(
                        // color: const Color(0xff974949),
                        color: Theme.of(context).textSelectionColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              _toggleBtn(true),
            ],
          ),
        ),
        SizedBox(
          height: 14.0,
        ),
        Expanded(
          child: pocket(_currentDiaries, context),
        ),
      ],
    );
  }

  Widget _toggleBtn(bool next) {
    return IconButton(
      icon: Icon(
        (next) ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_rounded,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          (next) ? _getNextMonth() : _getPrevMonth();
        });
      },
    );
  }

  void _getPrevMonth() {
    if (_currentDateTime.month == 1)
      _currentDateTime = DateTime(_currentDateTime.year - 1, 12);
    else
      _currentDateTime =
          DateTime(_currentDateTime.year, _currentDateTime.month - 1);
  }

  void _getNextMonth() {
    if (_currentDateTime.month == 12)
      _currentDateTime = DateTime(_currentDateTime.year + 1, 1);
    else
      _currentDateTime =
          DateTime(_currentDateTime.year, _currentDateTime.month + 1);
  }
}
