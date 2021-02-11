import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:project_moonhwadiary/models/diary.dart';
import 'package:project_moonhwadiary/widget/card.dart';

class DynamicHorizontalDemo extends StatefulWidget {
  List<Diary> diaries;

  DynamicHorizontalDemo({this.diaries});

  @override
  _DynamicHorizontalDemoState createState() => _DynamicHorizontalDemoState();
}

class _DynamicHorizontalDemoState extends State<DynamicHorizontalDemo> {
  SwiperController _controller;
  List<Diary> diaries = [];
  int _focusedIndex = 0;

  List<double> grayScale = <double>[
    0.2126,0.7152,0.0722,0,0,
    0.2126,0.7152,0.0722,0,0,
    0.2126,0.7152,0.0722,0,0,
    0,0,0,1,0,
  ];

  @override
  void initState() {
    super.initState();
    _controller = new SwiperController();
    diaries = widget.diaries;
  }

  void _onItemChange(int index) {
    _focusedIndex = index;
    print("now : " + _focusedIndex.toString());
  }

  _onItemDelete(){
  int delete_index = _focusedIndex; // 삭제될 인덱스

  print("delete_index : "+ delete_index.toString());

  if(diaries.isNotEmpty) {
    if(diaries.length > 1) _controller.next(animation: true);
    setState(() {
      // DB delete 함수 들어가야함
      // DBHelp.deleteDiary(diaies[delete_index].no);
      // 삭제 되면 진행
      diaries.removeAt(delete_index);
      print(delete_index.toString() + "삭제 됨");
      print(diaries.toString());
    });
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
        diaries.isNotEmpty? Swiper(
          scale:0.9,
          viewportFraction: 0.85,
          itemCount: diaries.length,
          controller: _controller,
          itemBuilder: _buildListItem,
          onIndexChanged: _onItemChange,
        ):Center(
          child: Text("더 이상 일기가 없어요😥", style: TextStyle(fontSize: 16),),
        ),
        diaries.isNotEmpty? Positioned(
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
                  ) :  ColorFilter.matrix(grayScale),
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
                  ) :  ColorFilter.matrix(grayScale),
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
                  ) :  ColorFilter.matrix(grayScale),
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
                  ) :  ColorFilter.matrix(grayScale),
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
                  ) : ColorFilter.matrix(grayScale),
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
        ): Text(""),
      ],
    );
  }
}