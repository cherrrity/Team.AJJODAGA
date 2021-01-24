import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:project_moonhwadiary/models/diary.dart';

class PhotoCard extends StatefulWidget {
  final Diary diary;

  PhotoCard(this.diary);

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<PhotoCard> {
  Diary diary;

  @override
  void initState() {
    super.initState();
    diary = widget.diary;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        // 메인 카드 앞면
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL, // default
          front: Container(
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.72,
            // 이미지가 있을 때 없을 때
            child: diary.image != null
                ? Center(
                    child: Column(
                      children: [
                        Positioned(
                          child: Container(
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
              color: diary.image != null ? Colors.white : Color(0xFFFDF5F5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          back: Container(
            // 메인 카드 뒷면
            width: MediaQuery.of(context).size.width * 0.92,
            height: MediaQuery.of(context).size.height * 0.72,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(children: [
                  SizedBox(height: 15),
                  InkWell(
                    child: Text(diary.day, style: TextStyle(fontSize: 20)),
                    onTap: () => {}, // date picker widget
                  ),
                  SizedBox(height: 10),
                  Text(
                    diary.title,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.52,
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      reverse: false,
                      child: Text(
                        diary.contents,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 수정 버튼
                      IconButton(
                          icon: Icon(
                            Icons.edit_rounded,
                            color: Colors.grey,
                          ),
                          onPressed: () => {}),
                      // 삭제 버튼
                      IconButton(
                          icon: Icon(
                            Icons.delete_rounded,
                            color: Colors.grey,
                          ),
                          onPressed: () => {}),
                    ],
                  )
                ]),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
