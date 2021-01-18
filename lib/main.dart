import 'package:flutter/material.dart';
import 'package:project_moonhwadiary/model_diary.dart';
import 'package:project_moonhwadiary/pocket.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'moonhwaDiary',
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.red[200],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _month = 1;

  List<Diary> diaries = [
    Diary.fromMap({
      'month': 1,
      'date': 1,
    }),
    Diary.fromMap({
      'month': 1,
      'date': 3,
    }),
    Diary.fromMap({
      'month': 1,
      'date': 6,
    }),
    Diary.fromMap({
      'month': 1,
      'date': 9,
    }),
    Diary.fromMap({
      'month': 1,
      'date': 10,
    }),
    Diary.fromMap({
      'month': 1,
      'date': 12,
    }),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFDBDB),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 6.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.settings,
                  size: 30.0,
                  color: const Color(0xffFEC4C4),
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '$_month월',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Expanded(
              child: Pocket(diaries: diaries),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 20.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.add_circle,
                  size: 60.0,
                  color: const Color(0xffFEC4C4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
