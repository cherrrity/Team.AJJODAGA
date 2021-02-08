import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'package:project_moonhwadiary/models/diary.dart';
import 'package:project_moonhwadiary/views/NeumorphicContainer.dart';

class WriteCardPage extends StatefulWidget {
  @override
  _WriteCardPage createState() => _WriteCardPage();
}

class _WriteCardPage extends State<WriteCardPage> {
  Diary _diary;
  bool _isPhoto = false;
  bool _isEdit = false;
  DateTime _currentDateTime = DateTime.now();

  List<double> grayScale = <double>[
    0.2126,0.7152,0.0722,0,0,
    0.2126,0.7152,0.0722,0,0,
    0.2126,0.7152,0.0722,0,0,
    0,0,0,1,0,
  ];

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _diary = ModalRoute.of(context).settings.arguments;
    _isEdit = _diary == null? false : true ;  // 수정인지 확인
    _currentDateTime = _isEdit? _diary.dateTime : DateTime.now(); // 수정일 때 수정 날짜로 변경
    _isPhoto = _diary.image == null? false : true;
  }

  void _showPicker() {
    DatePicker.showDatePicker(
      context,
      //locale: 'en',
      dateFormat: 'yyyy-mm',
      initialDateTime: _currentDateTime,
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _currentDateTime = dateTime;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFDBDB),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, bottom:30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 상단 아이콘 생성
                NeumorphicContainer(
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                    onTap: () => Navigator.pop(context),
                  ),
                  color: Color(0xFFFEC4C4),
                  shape: "iconButton",
                ),
                NeumorphicContainer(
                  child: GestureDetector(
                    child: Icon(Icons.check_rounded, color: Colors.white),
                    onTap: () => {
                      // card add function
                    },
                  ),
                  color: Color(0xFFFEC4C4),
                  shape: "iconButton",
                ),
              ],
            ),
          ),

          Center(
            // 메인 카드 앞면
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                padding: EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width * 0.92,
                height : MediaQuery.of(context).size.height * 0.72,
                // 이미지가 있을 때 없을 때
                child: _isPhoto ?
                Center(
                  child: Column(
                    children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            // 이미지 full cover
                            image: AssetImage(_diary.image),  // 카드가 될 이미지
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      _isEdit?  // 포토카드 사진 아래 타이틀
                      Text(_diary.title):
                      Text("")
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
                  color: _isPhoto ? Colors.white : Color(0xFFFDF5F5),
                  boxShadow:[
                    BoxShadow(
                      color : Colors.grey,
                    ),
                  ],
                ),
              ),
              back: Container(
                // 메인 카드 뒷면
                width: MediaQuery.of(context).size.width * 0.92,
                height : MediaQuery.of(context).size.height * 0.72,
                child: Center(
                  child: Form(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                          children: [
                            SizedBox(height: 15),
                            // 카드 입력(날짜)
                            InkWell(
                              child: Text('${_currentDateTime.year}년 ${_currentDateTime.month}월 ${_currentDateTime.day}일', style: TextStyle(fontSize: 20)),
                              onTap: () => _showPicker(), // date picker widget
                            ),
                            SizedBox(height: 10),
                            // 카드 입력(제목)
                            TextFormField(
                              initialValue : _isEdit? _diary.title: "",
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(40),
                              ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  hintText: '제목을 입력해 주세요'
                              ),
                            ),
                            Container(
                              height : MediaQuery.of(context).size.height * 0.4,
                              /*
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)
                              ),*/
                              child: SingleChildScrollView(
                                physics: ClampingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                reverse: false,
                                // 카드 입력(내용)
                                child : TextFormField(
                                  initialValue : _isEdit? _diary.contents: "",
                                  maxLines: null,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,
                                      hintText: '내용을 입력해 주세요'
                                  ),
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow:[
                    BoxShadow(
                      color : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            left : 10,
            bottom : 25,
            child: NeumorphicContainer(
              child: IconButton(
                icon: Icon(Icons.add_rounded),
                iconSize: 40,
                color: Colors.white,
                onPressed: () => {
                  // add function
                },
              ),
              color: Color(0xFFFEC4C4),
              shape: "add",
            ),
          ),
          Positioned(
              right: 40,
              bottom: 40,
              child: Container(
                child: Row(
                  children: [
                    InkWell(
                      child : ColorFiltered(
                        colorFilter: _diary.feel == 1? ColorFilter.mode(
                          Colors.transparent,
                          BlendMode.multiply,
                        ) :  ColorFilter.matrix(grayScale),
                        child: Image.asset(
                          'assets/emoji/emoji-3.png',
                          width: 30,
                        ),
                      ),
                      onTap: () => {
                        setState(() {
                          _diary.feel = 1;
                        })
                      },
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child : ColorFiltered(
                        colorFilter: _diary.feel == 2? ColorFilter.mode(
                          Colors.transparent,
                          BlendMode.multiply,
                        ) :  ColorFilter.matrix(grayScale),
                        child: Image.asset(
                          'assets/emoji/emoji-4.png',
                          width: 30,
                        ),
                      ),
                      onTap: () => {
                        setState(() {
                          _diary.feel = 2;
                        })
                      },
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child : ColorFiltered(
                        colorFilter: _diary.feel == 3? ColorFilter.mode(
                          Colors.transparent,
                          BlendMode.multiply,
                        ) :  ColorFilter.matrix(grayScale),
                        child: Image.asset(
                          'assets/emoji/emoji-13.png',
                          width: 30,
                        ),
                      ),
                      onTap: () => {
                        setState(() {
                          _diary.feel = 3;
                        })
                      },
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child : ColorFiltered(
                        colorFilter: _diary.feel == 4? ColorFilter.mode(
                          Colors.transparent,
                          BlendMode.multiply,
                        ) :  ColorFilter.matrix(grayScale),
                        child: Image.asset(
                          'assets/emoji/emoji-10.png',
                          width: 30,
                        ),
                      ),
                      onTap: () => {
                        setState(() {
                          _diary.feel = 4;
                        })
                      },
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child : ColorFiltered(
                        colorFilter: _diary.feel == 5? ColorFilter.mode(
                          Colors.transparent,
                          BlendMode.multiply,
                        ) :  ColorFilter.matrix(grayScale),
                        child: Image.asset(
                          'assets/emoji/emoji-9.png',
                          width: 30,
                        ),
                      ),
                      onTap: () => {
                        setState(() {
                          _diary.feel = 5;
                        })
                      },
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xfffafafa),
                ),
              )
          )
        ],
      ),
      // startdocked
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}