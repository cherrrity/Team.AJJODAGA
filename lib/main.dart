import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

// 라우터
import 'package:project_moonhwadiary/router/routers.dart';

// 모델
import 'package:project_moonhwadiary/models/diary.dart';
import 'package:project_moonhwadiary/widget/pocket.dart';
import 'package:project_moonhwadiary/modules/NeumorphicContainer.dart';
import 'package:project_moonhwadiary/widget/theme.dart';

// DB
import 'package:project_moonhwadiary/DB/DBHelp.dart';
import 'package:project_moonhwadiary/DB/ThemeController.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  set fontName(String value) => setState(() => _fontName = value);

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

  List<Diary> diaries = [];

  @override
  void initState() {
    super.initState();
    final date = DateTime.now();
    _currentDateTime = DateTime(date.year, date.month);
  }

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    diaries = await DBHelper().dateSelect(DateFormat('yyyy-MM').format(_currentDateTime));
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  _waitDiaryInsertPage(BuildContext context) async {
    final result = await
    Navigator.pushNamed(context, '/write_card');

    if(result == true){
      diaries = await DBHelper().dateSelect(DateFormat('yyyy-MM').format(_currentDateTime));
      setState(() {});
    }
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
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    double _height = MediaQuery.of(context).size.height - (statusBarHeight * 2);
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 설정
            Container(
              padding: EdgeInsets.only(top: statusBarHeight, bottom: _height*0.03, left: _width *0.05, right : _width * 0.05),
              alignment: Alignment.topLeft,
              child: NeumorphicContainer(
                child: GestureDetector(
                  child: Icon(Icons.settings, color: Colors.white, size:_width * 0.06),
                  onTap: () => Navigator.pushNamed(context, '/setting'),
                ),
                shape: "iconButton",
              ),
            ),
            Container(
              height: _height * 0.78,
              child: SimpleGestureDetector(
                onHorizontalSwipe: _onHorizontalSwipe,
                child: _datesView(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
        child: NeumorphicContainer(
          child: IconButton(
            icon: Icon(Icons.add_rounded),
            iconSize: _width * 0.09,
            color: Colors.white,
            onPressed: () => _waitDiaryInsertPage(context),
          ),
          shape: "add",
        ),
      ),
    );
  }

  void _showPicker() {
    DatePicker.showDatePicker(
      context,
      locale: DateTimePickerLocale.ko,
      dateFormat: 'yyyy-MM',
      initialDateTime: _currentDateTime,
      minDateTime: DateTime(2000),
      maxDateTime: DateTime.now(),
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _currentDateTime = dateTime;
          _datesView();
        });
      },
    );
  }

  Widget _datesView() {
    int yearNum = _currentDateTime.year;
    int monthNum = _currentDateTime.month;

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
          child: pocket(yearNum, monthNum, _currentDiaries, context),
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
          didChangeDependencies();
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
    if (_currentDateTime.year < DateTime.now().year
        || (_currentDateTime.year == DateTime.now().year && _currentDateTime.month < DateTime.now().month)) {
      if (_currentDateTime.month == 12)
        _currentDateTime = DateTime(_currentDateTime.year + 1, 1);
      else
        _currentDateTime = DateTime(_currentDateTime.year, _currentDateTime.month + 1);
    }
  }
}
