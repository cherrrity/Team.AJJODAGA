import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'package:project_moonhwadiary/modules/HorizontalList.dart';
import 'package:project_moonhwadiary/modules/NeumorphicContainer.dart';
import 'package:project_moonhwadiary/models/diary.dart';

//DB
import 'package:project_moonhwadiary/DB/DBHelp.dart';

class ViewCardPage extends StatefulWidget {
  @override
  _ViewCardPage createState() => _ViewCardPage();
}

class _ViewCardPage extends State<ViewCardPage> {
  List<Diary> _diaries;
  String _date;
  bool _isPhoto = true;
  bool _isKeyboardUp = false;

  @override
  void initState() {
    // TODO: implement initState
    _diaries = [
      Diary(
        title: "test1",
        contents: "test",
        dateTime: DateFormat('yyyy-MM-dd').parse('2020-01-04'),
        feel: 1,
        image: ""
      ), Diary(
          title: "test2",
          contents: "test",
          dateTime: DateFormat('yyyy-MM-dd').parse('2020-01-04'),
          feel: 2,
          image: ""
      ), Diary(
          title: "test3",
          contents: "test",
          dateTime: DateFormat('yyyy-MM-dd').parse('2020-01-04'),
          feel: 3,
          image: ""
      ), Diary(
          title: "test4",
          contents: "test",
          dateTime: DateFormat('yyyy-MM-dd').parse('2020-01-04'),
          feel: 5,
          image: ""
      ),
    ];
  }

  @override
  void didChangeDependencies() {
    _date = ModalRoute.of(context).settings.arguments;

    if(_date != null){
      // 일자에 맞는 일기 db에서 찾아오기
      //_diaries = new DBHelp.selectDiary(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          DynamicHorizontalList(diaries: _diaries),
          Container(
            margin:
                const EdgeInsets.only(top: 40, bottom: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 상단 아이콘 생성
                NeumorphicContainer(
                  child: GestureDetector(
                    child:
                        Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                    onTap: () => Navigator.pop(context),
                  ),
                  shape: "iconButton",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
