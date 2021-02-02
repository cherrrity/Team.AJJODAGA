import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'package:carousel_slider/carousel_slider.dart';

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
  int _focusedIndex = 0;


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
        dateTime: "2020-01-03",
        feel: 1
      ),
      Diary(
        title: "오늘 콘서트 너무 재밌었다😂",
        contents: "1년 6개월",
          dateTime: "2020-01-03",
        feel: 2
      ),
      Diary(
        title: "오늘 콘서트 너무 재밌었다😂",
        contents: "1년 6개월",
          dateTime: "2020-01-03",
          feel: 3
      ),Diary(
        title: "오늘 콘서트 너무 재밌었다😂",
        contents: "1년 6개월",
          dateTime: "2020-01-03",
          feel: 1
      ),Diary(
        title: "오늘 콘서트 너무 재밌었다😂",
        contents: "1년 6개월",
          dateTime: "2020-01-03",
          feel: 5
      )
    ];
  }

  void _onItemFocus(int index) {
    print(index);
    setState(() {
      _focusedIndex = index;
    });
  }

  _onItemDelete(){
    diaries.removeAt(_focusedIndex);

    if(diaries.isNotEmpty) setState(() {});
    else {
      print("empty");
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("알림"),
              content: Text("더 이상 일기가 없습니다."),
              actions: [
                new FlatButton(onPressed: ()=>{
                  // route to home

                }, child: Text("확인"))
              ],
            );
          }
      );
    }

  }

  Widget _buildListItem(BuildContext context, int index) {
    if (index == diaries.length)
      return Center(child: CircularProgressIndicator(),);

    //horizontal
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      child: PhotoCard(diaries[index], _onItemDelete),
      //child: PhotoCard(diaries[index]),
    );
  }

  ///Override default dynamicItemSize calculation
  double customEquation(double distance){
    return 1-min(distance.abs()/500, 0.2);
    // return 1-(distance/1000);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ScrollSnapList(
          onItemFocus: _onItemFocus,
          itemSize: MediaQuery.of(context).size.width * 0.92,
          itemBuilder: _buildListItem,
          itemCount: diaries.length,
          dynamicItemSize: true,
          dynamicSizeEquation: customEquation, //optional
        ),

        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.2,
          child: Container(
            width: 230,
            child: Row(
              children: [
                ColorFiltered(
                  colorFilter: diaries[_focusedIndex].feel == 1? ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.multiply,
                  ) : ColorFilter.matrix(<double>[
                    0.2126,0.7152,0.0722,0,0,
                    0.2126,0.7152,0.0722,0,0,
                    0.2126,0.7152,0.0722,0,0,
                    0,0,0,1,0,
                  ]),
                  child: Image.asset(
                  'assets/emoji/emoji-3.png',
                  width: 30,
                  ),
                ),
                SizedBox(width: 10),
                ColorFiltered(
                  colorFilter: diaries[_focusedIndex].feel == 2? ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.multiply,
                  ) : ColorFilter.matrix(<double>[
                    0.2126,0.7152,0.0722,0,0,
                    0.2126,0.7152,0.0722,0,0,
                    0.2126,0.7152,0.0722,0,0,
                    0,0,0,1,0,
                  ]),
                  child: Image.asset(
                    'assets/emoji/emoji-4.png',
                    width: 30,
                  ),
                ),
                SizedBox(width: 10),
                ColorFiltered(
                  colorFilter: diaries[_focusedIndex].feel == 3? ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.multiply,
                  ) : ColorFilter.matrix(<double>[
                    0.2126,0.7152,0.0722,0,0,
                    0.2126,0.7152,0.0722,0,0,
                    0.2126,0.7152,0.0722,0,0,
                    0,0,0,1,0,
                  ]),
                  child: Image.asset(
                    'assets/emoji/emoji-13.png',
                    width: 30,
                  ),
                ),
                SizedBox(width: 10),
                ColorFiltered(
                  colorFilter: diaries[_focusedIndex].feel == 4? ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.multiply,
                  ) : ColorFilter.matrix(<double>[
                    0.2126,0.7152,0.0722,0,0,
                    0.2126,0.7152,0.0722,0,0,
                    0.2126,0.7152,0.0722,0,0,
                    0,0,0,1,0,
                  ]),
                  child: Image.asset(
                    'assets/emoji/emoji-10.png',
                    width: 30,
                  ),
                ),
                SizedBox(width: 10),
                ColorFiltered(
                  colorFilter: diaries[_focusedIndex].feel == 5? ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.multiply,
                  ) : ColorFilter.matrix(<double>[
                    0.2126,0.7152,0.0722,0,0,
                    0.2126,0.7152,0.0722,0,0,
                    0.2126,0.7152,0.0722,0,0,
                    0,0,0,1,0,
                  ]),
                  child: Image.asset(
                    'assets/emoji/emoji-2.png',
                    width: 30,
                  ),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: const Color(0xfffafafa),
            ),
          ),
        ),
      ],
    );
  }
}