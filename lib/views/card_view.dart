import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'package:project_moonhwadiary/modules/HorizontalList.dart';
import 'file:///C:/Users/hyej0/AndroidStudioProjects/Team.AJJODAGA/lib/modules/NeumorphicContainer.dart';

class ViewCardPage extends StatefulWidget {
  @override
  _ViewCardPage createState() => _ViewCardPage();
}

class _ViewCardPage extends State<ViewCardPage> {
  bool _isPhoto = true;
  bool _isKeyboardUp = false;
  DateTime _diaryDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFDBDB),
      body: Stack(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 20, bottom: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 상단 아이콘 생성
                NeumorphicContainer(
                  child: GestureDetector(
                    child:
                        Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                    onTap: () => {print("back")},
                  ),
                  color: Color(0xFFFEC4C4),
                  shape: "iconButton",
                ),
              ],
            ),
          ),
          DynamicHorizontalDemo(),


        ],
      ),
    );
  }
}
