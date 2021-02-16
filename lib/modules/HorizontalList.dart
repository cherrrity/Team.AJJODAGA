import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:project_moonhwadiary/models/diary.dart';
import 'package:project_moonhwadiary/widget/card.dart';


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
    print("hor di : " + diaries.toString());
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
    print("horizon : " + diaries.toString());
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
    String emptyImage;

    for(int i = 0; i < diaries.length; i++){
      emptyImage = _initImages();
      print("image : " + emptyImage);
      item = Container(
        child: PhotoCard(diaries[i], _onItemDelete, i, emptyImage),
        //child: PhotoCard(diaries[index]),
      );
      cards.add(item);
    }
    return cards;
  }

  String _initImages()  {
    // >> To get paths you need these 2 lines
    var iconList = ["001-evil.svg",
      "002-sleep.svg",
      "003-mask.svg",
      "004-winkle.svg",
      "005-cry.svg",
      "006-mermaid.svg",
      "007-dance.svg",
      "008-rich.svg",
      "009-cake.svg",
      "010-sick.svg",
      "011-yes.svg",
      "012-scared.svg",
      "013-wine.svg",
      "014-sad.svg",
      "015-question.svg",
      "016-intimidate.svg",
      "017-ok.svg",
      "018-flirt.svg",
      "019-celebrate.svg",
      "020-hurry.svg",
      "021-cupcake.svg",
      "022-unicorn.svg",
      "023-greeting.svg",
      "024-hungry.svg",
      "025-happy.svg",
      "026-sunglasses.svg",
      "027-puke.svg",
      "028-kiss.svg",
      "029-vain.svg",
      "030-toy.svg",
      "031-surprise.svg",
      "032-rubber ring.svg",
      "033-mad.svg",
      "034-headband.svg",
      "035-tired.svg",
      "036-No.svg",
      "037-cat.svg",
      "038-unamused.svg",
      "039-what.svg",
      "040-glutton.svg",
      "041-love.svg",
      "042-dramatic.svg",
      "043-angry.svg",
      "044-nervous.svg",
      "045-fashion.svg",
      "046-shy.svg",
      "047-curious.svg",
      "048-origami.svg",
      "049-rolling eyes.svg",
      "050-laugh.svg"];
    // >> To get paths you need these 2 lines

    final randIndex = Random().nextInt(iconList.length);
    return iconList[randIndex];
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