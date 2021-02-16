import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'package:project_moonhwadiary/modules/HorizontalList.dart';
import 'package:project_moonhwadiary/modules/NeumorphicContainer.dart';
import 'package:project_moonhwadiary/models/diary.dart';
import 'package:project_moonhwadiary/widget/cardList.dart';

//DB
import 'package:project_moonhwadiary/DB/DBHelp.dart';

class ViewCardPage extends StatefulWidget {
  @override
  _ViewCardPage createState() => _ViewCardPage();
}

class _ViewCardPage extends State<ViewCardPage> with SingleTickerProviderStateMixin {
  List<Diary> _diaries = [];
  String _date;
  bool _isPhoto = true;
  bool _isKeyboardUp = false;


  @override
  void initState() {
    super.initState();
    _date = "2021-02-15";
  }

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _date = ModalRoute.of(context).settings.arguments;

    print("2021-02-${_date} main didChange");
    _diaries = await DBHelper().dateSelect(_date);
    setState(() {});
  }

  @override
  Widget build(BuildContext context)  {

    double _height = MediaQuery.of(context).size.height;// - MediaQuery.of(context).padding.top;
    double _width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //DynamicHorizontalList(diaries: _diaries),
          cardView(_diaries, context),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom:20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 상단 아이콘 생성
                NeumorphicContainer(
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                    onTap: () => Navigator.pop(context),
                  ),
                  shape: "iconButton",
                ),
              ],
            ),
          ),
        ],
      ),
      // startdocked
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
