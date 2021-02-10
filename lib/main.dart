import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:project_moonhwadiary/model/diary.dart';
import 'package:project_moonhwadiary/views/settings.dart';
import 'package:project_moonhwadiary/widget/pocket.dart';
import 'package:project_moonhwadiary/views/NeumorphicContainer.dart';

// 세팅
import 'package:project_moonhwadiary/DB/userSetting.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();

  static MyAppState of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'moonhwaDiary',
      theme: ThemeData(
        fontFamily: _fontName,
        scaffoldBackgroundColor: _backColor,
        backgroundColor: _btnColor,
        accentColor: _shadowColor,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  DateTime _currentDateTime;
  UserSetting _setting;
  int _counter;

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
      dateTime: DateTime(2021, 2, 8),
      feel: 1,
    ),
    Diary(
      dateTime: DateTime(2021, 2, 11),
      feel: 3,
    ),
  ];

  @override
  void initState() {
    super.initState();
    print("now user_setting : "+ _setting.toString());
    getUserInfo();
    final date = DateTime.now();
    _currentDateTime = DateTime(date.year, date.month);
  }

  Future<void> saveUserSetting() async {

    String themeName = (_setting != null && _setting.theme.themeName == "pink")? "blue" : "pink";

    final UserSetting user = UserSetting.fromJson({
      'theme': {
        'themeName': '$themeName',
        'pocketColor': ["FFDBDB", "FFDBDB"]
      },
      'font': '맑은 고딕'
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString('userSetting', jsonEncode(user));
    print("change : $result");
    print("now user_setting : "+ _setting.toString());
  }

  Future<UserSetting> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap;
    final String userStr = prefs.getString('userSetting');
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
    }

    if (userMap != null) {
      final UserSetting user = UserSetting.fromJson(userMap);
      _setting = user;
      print("get user_setting : "+ _setting.toString());
      return user;
    }
    return null;
  }


  @override
  void dispose() {
    super.dispose();
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
    final height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

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
                color: const Color(0xFFFEC4C4),
                shape: "iconButton",
              ),
            ),
            Container(
              height: height * 0.78,
              child: _datesView(),
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
                    onPressed: () => Navigator.pushNamed(context, '/write_card'),
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
    for(var i = 0; i < diaries.length; i++){
      if(_currentDateTime.year == diaries[i].dateTime.year && _currentDateTime.month == diaries[i].dateTime.month) _currentDiaries.add(diaries[i]);
    }

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
                        color: const Color(0xff974949),
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
          child: pocket(_currentDiaries),
        ),
      ],
    );
  }

  Widget _toggleBtn(bool next) {
    return IconButton(
      icon: Icon(
        (next) ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
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
    if (_currentDateTime.month == 1) _currentDateTime = DateTime(_currentDateTime.year - 1, 12);
    else _currentDateTime = DateTime(_currentDateTime.year, _currentDateTime.month - 1);
  }

  void _getNextMonth() {
    if (_currentDateTime.month == 12) _currentDateTime = DateTime(_currentDateTime.year + 1, 1);
    else _currentDateTime = DateTime(_currentDateTime.year, _currentDateTime.month + 1);
  }

}
