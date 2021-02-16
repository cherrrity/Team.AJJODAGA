import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:project_moonhwadiary/widget/card.dart';
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

class _ViewCardPage extends State<ViewCardPage> with SingleTickerProviderStateMixin {
  List<Diary> _diaries = [];
  String _date;
  bool _isPhoto = true;
  bool _isKeyboardUp = false;

  List<double> grayScale = <double>[
    0.2126,0.7152,0.0722,0,0,
    0.2126,0.7152,0.0722,0,0,
    0.2126,0.7152,0.0722,0,0,
    0,0,0,1,0,
  ];

  List<Widget> cards = [];
  List<Diary> diaries = [];
  int _focusedIndex = 0;
  PageController _pageController;
  bool _checkOnce = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    _date = "2021-02-15";
  }

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _date = ModalRoute.of(context).settings.arguments;
  }


  Future<List<Diary>> _getDiaries(String date) async {
    // 날짜 수정
    _diaries = await DBHelper().selectDiary("2021-02-16");
    return _diaries;
  }

  @override
  Widget build(BuildContext context)  {

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    double _height = MediaQuery.of(context).size.height - (statusBarHeight * 2);
    double _width = MediaQuery.of(context).size.width;
    double _cardHeight = _height * 0.72;
    double _cardWidth = _width * 0.92;

    // TODO: implement build
    return FutureBuilder(
      future: _getDiaries(_date),
      builder: (context, snapshot){
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: statusBarHeight),
            child:  Stack(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //DynamicHorizontalList(diaries: snapshot.data),
                cardView(snapshot.data),
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
          ),
        );
      },
    );
  }

  Widget cardView(List<Diary> list) {
    buildListItem(list);

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

  _onItemChange(int index){
    setState(() {
      _focusedIndex = index;
    });
  }

  _onItemDelete() async{
    print("delete");
    var delete_index = _focusedIndex;

    if (diaries.isNotEmpty) {
      if(cards.length > 1 && _focusedIndex < cards.length-1) {
        animationMvePage(1);
        //_pageController.jumpToPage(_focusedIndex-1);
      }else{
        animationMvePage(-1);
      }

      setState(() {
        diaries.removeAt(delete_index);
        cards.removeAt(delete_index);
        if(_focusedIndex >= diaries.length) _focusedIndex = 0;
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

  List<Widget> buildListItem(List<Diary> _list){
    print("builder");
    Widget item;
    String emptyImage;
    if(!_checkOnce){
      diaries = _list;
      for(int i = 0; i < _list.length; i++){
        emptyImage = _initImages();
        print("image : " + emptyImage);
        item = Container(
          child: PhotoCard(_list[i], _onItemDelete, i, emptyImage),
          //child: PhotoCard(diaries[index]),
        );
        cards.add(item);
      }
      _checkOnce = true;
    }
    return cards;
  }


}
