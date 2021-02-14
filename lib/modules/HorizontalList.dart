import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:project_moonhwadiary/models/diary.dart';
import 'package:project_moonhwadiary/widget/card.dart';

import '../main.dart';

class DynamicHorizontalList extends StatefulWidget {
  List<Diary> diaries;

  DynamicHorizontalList({this.diaries});

  @override
  _DynamicHorizontalList createState() => _DynamicHorizontalList();
}

class _DynamicHorizontalList extends State<DynamicHorizontalList>{

  PageController _pageController;
  ScrollController _scrollController;
  SwiperController _controller;


  List<Diary> diaries = [];
  List<Widget> cards = [];
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
    _scrollController = new ScrollController();
    _pageController = new PageController(initialPage: _focusedIndex);
    diaries = widget.diaries;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //Navigator.popAndPushNamed(context,'/card');
    buildListItem();
  }

  @override
  void didUpdateWidget(DynamicHorizontalList oldWidget){
    super.didUpdateWidget(oldWidget);
    print("horizon didUpdateWidget");
  }

  void _onItemChange(int index) {
    setState(() {
      if(index >= diaries.length) _focusedIndex = 0;
      _focusedIndex = index;
      print(_focusedIndex.toString()+" / "+(cards.length-1).toString());

    });
  }


  _onItemDelete() async{
    var delete_index = _focusedIndex;
    if (diaries.isNotEmpty) {
      if(cards.length > 1 && _focusedIndex < cards.length-1) {
        animationMvePage(1);
        //_pageController.jumpToPage(_focusedIndex-1);
      }else{
        animationMvePage(-1);
      }

       setState(() {
         print("controller : "+ _pageController.page.toString()+" / focus : "+_focusedIndex.toString()+" / del_i : "+delete_index.toString());
         print("delete");
        diaries.removeAt(delete_index);
        cards.removeAt(delete_index);
        if(_focusedIndex >= diaries.length) _focusedIndex = 0;
         didUpdateWidget(context.widget);
      });
    }
  }

  void animationMvePage(int index){
     _pageController.animateToPage(_focusedIndex + index,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn
    );
     if(diaries.length > 1) _focusedIndex = _focusedIndex + index;
     else _focusedIndex = 0;
  }

  void movePage(int index){
    _focusedIndex = index;
    _pageController.jumpToPage(index);
  }



 List<Widget> buildListItem(){
    Widget item;

    for(int i = 0; i < diaries.length; i++){
      item = Container(
        child: PhotoCard(diaries[i], _onItemDelete, i),
        //child: PhotoCard(diaries[index]),
      );
      cards.add(item);
    }
    return cards;
  }

  Widget _buildListItem(BuildContext context, int index) {
    Widget item;
    if (index < diaries.length) {
      item = Container(
        child: PhotoCard(diaries[index], _onItemDelete, index),
        //child: PhotoCard(diaries[index]),
      );
      //horizontal
      cards.add(item);
      return item;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        diaries.isNotEmpty?
            PageView(
              children: cards,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: _onItemChange,
            )
            : Center(
          child: Text(
            "더 이상 일기가 없어요😥",
            style: TextStyle(fontSize: 16),
          ),
        ),
        diaries.isNotEmpty
            ? Positioned(
          bottom: MediaQuery
              .of(context)
              .size
              .height * 0.05,
          left: MediaQuery
              .of(context)
              .size
              .width * 0.2,
          child: Container(
            width: 230,
            child: Row(
              children: [
                ColorFiltered(
                  colorFilter: diaries[_focusedIndex].feel == 1
                      ? ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.multiply,
                  )
                      : ColorFilter.matrix(grayScale),
                  child: Image.asset(
                    'assets/emoji/emoji-3.png',
                    width: 30,
                  ),
                ),
                SizedBox(width: 10),
                ColorFiltered(
                  colorFilter: diaries[_focusedIndex].feel == 2
                      ? ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.multiply,
                  )
                      : ColorFilter.matrix(grayScale),
                  child: Image.asset(
                    'assets/emoji/emoji-4.png',
                    width: 30,
                  ),
                ),
                SizedBox(width: 10),
                ColorFiltered(
                  colorFilter: diaries[_focusedIndex].feel == 3
                      ? ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.multiply,
                  )
                      : ColorFilter.matrix(grayScale),
                  child: Image.asset(
                    'assets/emoji/emoji-13.png',
                    width: 30,
                  ),
                ),
                SizedBox(width: 10),
                ColorFiltered(
                  colorFilter: diaries[_focusedIndex].feel == 4
                      ? ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.multiply,
                  )
                      : ColorFilter.matrix(grayScale),
                  child: Image.asset(
                    'assets/emoji/emoji-10.png',
                    width: 30,
                  ),
                ),
                SizedBox(width: 10),
                ColorFiltered(
                  colorFilter: diaries[_focusedIndex].feel == 5
                      ? ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.multiply,
                  )
                      : ColorFilter.matrix(grayScale),
                  child: Image.asset(
                    'assets/emoji/emoji-2.png',
                    width: 30,
                  ),
                ),
              ],
            ),
            padding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: const Color(0xfffafafa),
            ),
          ),
        ) : Text(""),
      ],
    );
  }
}