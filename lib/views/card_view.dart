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
  DynamicHorizontalList horizontalList;
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
        contents: '''느낌이 오잖아 떨리고 있잖아
언제까지 눈치만 볼 거니
네 맘을 말해봐 딴청 피우지 말란 말이야
네 맘 가는 그대로 지금 내 손을 잡아
어서 내 손을 잡아
우연히 고개를 돌릴 때 마다
눈이 마주치는 건
몇일밤 내내 꿈속에 나타나
밤새 나를 괴롭히는 건
그 많은 빈자리 중에서 하필
내 옆자릴 고르는 건
나도 모르게 어느새 실없는 웃음
흘리고 있다는 건
그럼 말 다했지 뭐, 우리 얘기 좀 할까
느낌이 오잖아 떨리고 있잖아
언제까지 눈치만 볼 거니
네 맘을 말해봐 딴청 피우지 말란 말이야
네 맘 가는 그대로 지금 내 손을 잡아''',
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
    super.didChangeDependencies();
    print("cardView didChange");
    _date = ModalRoute.of(context).settings.arguments;

    if(_date != null){
      // 일자에 맞는 일기 db에서 찾아오기
      //_diaries = new DBHelp.selectDiary(date);
    }
  }

  @override
  void didUpdateWidget(ViewCardPage oldWidget){
    super.didUpdateWidget(oldWidget);
    print("cardView didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          horizontalList = DynamicHorizontalList(diaries: _diaries),
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
