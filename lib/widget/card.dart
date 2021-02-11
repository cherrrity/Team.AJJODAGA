import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:project_moonhwadiary/models/diary.dart';

class PhotoCard extends StatefulWidget {
  final Diary diary;
  final VoidCallback callback;

  PhotoCard(this.diary, this.callback);

  @override
  _CardState createState() => _CardState(this.callback);
}

class _CardState extends State<PhotoCard> {
  Diary diary;
  final VoidCallback onDeleteItem;

  _CardState(this.onDeleteItem);

  @override
  void initState() {
    super.initState();
    diary = widget.diary;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: null,
      width: MediaQuery.of(context).size.width * 0.92,
      height: MediaQuery.of(context).size.height * 0.72,
      child: Center(
        // 메인 카드 앞면
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL, // default
          front: Container(
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.72,
            // 이미지가 있을 때 없을 때
            child: diary.image != ''
                ? Center(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.62,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              // 이미지 full cover
                              image: AssetImage(diary.image), // 카드가 될 이미지
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("소제목")
                      ],
                    ),
                  )
                : Center(
                    child: SvgPicture.asset(
                      'assets/images/empty_card_cat.svg',
                      width: 150,
                    ),
                  ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: diary.image != null ? Colors.white : Theme.of(context).highlightColor,
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
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.72,
            child: Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 9),
                      Text(
                        '${diary.dateTime.year}. ${diary.dateTime.month}. ${diary.dateTime.day}.',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).accentColor), textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Text(
                        diary.title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.52,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(diary.contents, style: TextStyle(fontSize: 16), textAlign: TextAlign.left,)
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Theme.of(context).accentColor.withOpacity(0.1),
                  ),
                ),
                SizedBox(height: 10),
                Container(
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
