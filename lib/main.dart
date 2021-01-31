import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_moonhwadiary/model/model_diary.dart';
import 'package:project_moonhwadiary/widget/pocket.dart';
import 'package:project_moonhwadiary/modules/neumorphicContainer.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'moonhwaDiary',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDateTime;

  List<Diary> diaries = [
    Diary.fromMap({
      'year': 2020,
      'month': 12,
      'date': 3,
      'satisfaction': 2,
    }),
    Diary.fromMap({
      'year': 2020,
      'month': 12,
      'date': 5,
      'satisfaction': 3,
    }),
    Diary.fromMap({
      'year': 2020,
      'month': 12,
      'date': 9,
      'satisfaction': 4,
    }),
    Diary.fromMap({
      'year': 2020,
      'month': 12,
      'date': 17,
      'satisfaction': 1,
    }),
    Diary.fromMap({
      'year': 2020,
      'month': 12,
      'date': 24,
      'satisfaction': 5,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 1,
      'satisfaction': 3,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 2,
      'satisfaction': 2,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 3,
      'satisfaction': 1,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 4,
      'satisfaction': 4,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 5,
      'satisfaction': 5,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 6,
      'satisfaction': 4,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 7,
      'satisfaction': 1,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 8,
      'satisfaction': 2,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 9,
      'satisfaction': 3,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 10,
      'satisfaction': 4,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 11,
      'satisfaction': 5,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 12,
      'satisfaction': 2,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 13,
      'satisfaction': 3,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 14,
      'satisfaction': 2,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 15,
      'satisfaction': 1,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 16,
      'satisfaction': 3,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 17,
      'satisfaction': 5,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 18,
      'satisfaction': 4,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 19,
      'satisfaction': 5,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 20,
      'satisfaction': 2,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 21,
      'satisfaction': 1,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 22,
      'satisfaction': 3,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 23,
      'satisfaction': 1,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 24,
      'satisfaction': 4,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 25,
      'satisfaction': 3,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 26,
      'satisfaction': 2,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 27,
      'satisfaction': 1,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 28,
      'satisfaction': 2,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 29,
      'satisfaction': 5,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 30,
      'satisfaction': 4,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 1,
      'date': 31,
      'satisfaction': 1,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 2,
      'date': 2,
      'satisfaction': 4,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 2,
      'date': 8,
      'satisfaction': 1,
    }),
    Diary.fromMap({
      'year': 2021,
      'month': 2,
      'date': 11,
      'satisfaction': 3,
    }),
  ];

  @override
  void initState() {
    super.initState();
    final date = DateTime.now();
    _currentDateTime = DateTime(date.year, date.month);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: const Color(0xffFFDBDB),
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
                  onTap: () => {print("settings")},
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
                    onPressed: () => {print("add")},
                  ),
                ),
                color: const Color(0xFFFEC4C4),
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
      if(_currentDateTime.year == diaries[i].year && _currentDateTime.month == diaries[i].month) _currentDiaries.add(diaries[i]);
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
