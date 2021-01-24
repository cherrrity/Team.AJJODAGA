import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'package:project_moonhwadiary/models/diary.dart';
import 'package:project_moonhwadiary/widget/card.dart';

class DynamicHorizontalDemo extends StatefulWidget {
  final List<Diary> diaries;

  DynamicHorizontalDemo({this.diaries});

  @override
  _DynamicHorizontalDemoState createState() => _DynamicHorizontalDemoState();
}

class _DynamicHorizontalDemoState extends State<DynamicHorizontalDemo> {
  List<Diary> diaries = [];
  int _focusedIndex = -1;

  @override
  void initState() {
    super.initState();
    diaries = widget.diaries;

    diaries = [
      Diary(
        image: "assets/images/test.jpg",
        title: "chew not choi",
        contents: "최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔"+
            "최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔"+
            "최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔"+
            "최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔"+
            "최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔"+
            "최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔"+
            "최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔"+
            "최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔"+
            "최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔최한솔 한솔한솔한솔",
        day: "2020-01-03",
      ),
      Diary(
        title: "오늘 콘서트 너무 재밌었다😂",
        contents: "1년 6개월",
        day: "2020-01-03",
      )
    ];
  }

  void _onItemFocus(int index) {
    print(index);
    setState(() {
      _focusedIndex = index;
    });
  }

  Widget _buildListItem(BuildContext context, int index) {
    if (index == diaries.length)
      return Center(child: CircularProgressIndicator(),);

    //horizontal
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      child: PhotoCard(diaries[index]),
    );
  }

  ///Override default dynamicItemSize calculation
  double customEquation(double distance){
    return 1-min(distance.abs()/500, 0.2);
    //return 1-(distance/500);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ScrollSnapList(
            onItemFocus: _onItemFocus,
            itemSize: MediaQuery.of(context).size.width * 0.92,
            itemBuilder: _buildListItem,
            itemCount: diaries.length,
            dynamicItemSize: false,
            // dynamicSizeEquation: customEquation, //optional
          ),
        ),
      ],
    );
  }
}