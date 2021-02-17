
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:project_moonhwadiary/models/diary.dart';

class PhotoCard extends StatefulWidget {
  _CardState cardstate;
  final Diary diary;
  final VoidCallback callback;
  final int index;
  final String emptyImage;


  PhotoCard(this.diary, this.callback, this.index, this.emptyImage);

  @override
  _CardState createState() {
    cardstate = _CardState(this.callback);
    return cardstate;
  }
  getState() => cardstate;
}

class _CardState extends State<PhotoCard>{
  Diary diary;
  final VoidCallback onDeleteItem;
  int index;
  String _emptyImage;

  _CardState(this.onDeleteItem);

  @override
  void initState() {
    super.initState();
    diary = widget.diary;
    print(diary.image);
    _emptyImage = widget.emptyImage;
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    double _height = MediaQuery.of(context).size.height - (statusBarHeight * 2);
    double _width = MediaQuery.of(context).size.width;
    double _cardHeight = _height * 0.72;
    double _cardWidth = _width * 0.9;
    double _innerImageHeight = _cardHeight * 0.83;
    double _innerImageWidth = _cardWidth * 0.95;

    // TODO: implement build
    return Container(
      padding: null,
      width: _cardWidth,
      height: _cardHeight,
      child: Center(
        // 메인 카드 앞면
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL, // default
          front: Container(
            padding: EdgeInsets.all(_cardHeight*0.02),
            width: _cardWidth,
            height: _cardHeight,
            // 이미지가 있을 때 없을 때
            child: diary.image != ''
                ? Center(
                    child: Column(
                      children: [
                        Container(
                          width: _innerImageWidth,
                          height: _innerImageHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              // 이미지 full cover
                              image: FileImage(File(diary.image)), // 카드가 될 이미지
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: _cardHeight*0.05,
                        ),
                        Text(diary.title)
                      ],
                    ),
                  )
                : Center(
                    child: SvgPicture.asset(
                      'assets/icons/'+_emptyImage,
                      width: 150,
                    ),
                  ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: diary.image != '' ? Colors.white : Theme.of(context).highlightColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).accentColor.withOpacity(0.4),
                  offset: Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
          ),
          back: Container(
            // 메인 카드 뒷면
            width: _cardWidth,
            height: _cardHeight,
            child: Padding(
              padding: EdgeInsets.all(_cardHeight*0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 80,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${diary.dateTime.year}. ${diary.dateTime.month}. ${diary.dateTime.day}.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).accentColor), textAlign: TextAlign.left,
                          ),
                          SizedBox(height: _cardHeight*0.01),
                          Text(
                            diary.title,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                          SizedBox(height: _cardHeight*0.01),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: (_cardHeight - _cardHeight * 0.08) - 135,
                    width: _cardWidth,
                    child: OverflowBox(
                      child:  Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(diary.contents, style: TextStyle(fontSize: 16, height: 1.35),  textAlign: TextAlign.left,)
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: _cardHeight * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.edit_rounded,
                                color: Colors.grey,
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, '/write_card',
                                  arguments: diary)),
                          IconButton(
                              icon: Icon(
                                Icons.delete_rounded,
                                color: Colors.grey,
                              ),
                              onPressed: () => {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("일기 삭제"),
                                        content: Text("삭제하시겠습니까?"),
                                        actions: [
                                          FlatButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text("취소")),
                                          FlatButton(
                                              onPressed: () => {
                                                onDeleteItem(),
                                                Navigator.pop(context),
                                              },
                                              child: Text("확인")),
                                        ],
                                      );
                                    }),
                              }),
                        ],
                      ),
                    ),
                  ),
              ]),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).accentColor.withOpacity(0.4),
                  offset: Offset(5.0, 5.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
