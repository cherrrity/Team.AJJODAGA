import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_moonhwadiary/DB/DBHelp.dart';

import 'package:project_moonhwadiary/models/diary.dart';
import 'package:project_moonhwadiary/modules/NeumorphicContainer.dart';

class WriteCardPage extends StatefulWidget {
  @override
  _WriteCardPage createState() => _WriteCardPage();
}

class _WriteCardPage extends State<WriteCardPage> {
  Diary _diary = new Diary();
  bool _isPhoto = false;
  bool _isEdit = false;
  DateTime _currentDateTime = DateTime.now();

  File _image;
  final picker = ImagePicker();
  String image_file = "";

  List<double> grayScale = <double>[
    0.2126,0.7152,0.0722,0,0,
    0.2126,0.7152,0.0722,0,0,
    0.2126,0.7152,0.0722,0,0,
    0,0,0,1,0,
  ];

  final _contentFocusNode = FocusNode();
  final _editController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _editController.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var arg = ModalRoute.of(context).settings.arguments;
    if(arg != null) _diary = arg;
    _isEdit = arg == null? false : true ;  // 수정인지 확인
    _currentDateTime = _isEdit? _diary.dateTime : DateTime.now(); // 수정일 때 수정 날짜로 변경
    _isPhoto = false;
  }

  void _showPicker() {
    DatePicker.showDatePicker(
      context,
      locale: 'ko',
      dateFormat: 'yyyy-MM-dd',
      initialDateTime: _currentDateTime,
      minDateTime: DateTime(2000),
      maxDateTime: DateTime.now(),
      onConfirm2: (dateTime, List<int> index) {
        setState(() {
          _currentDateTime = dateTime;
          _diary.dateTime = dateTime;
        });
      },
    );
  }

  Future getImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);

    setState(() {
      if (pickedFile != null) {
        this.image_file = pickedFile.path;
        print("selected image_path: $image_file");
        _diary.image = image_file;
        _image = File(pickedFile.path);
      }
    });
  }


  void saveForm() {
    _form.currentState.save();
    DBHelper().insertDiary(_diary);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
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
                  shape: "iconButton",
                ),
                NeumorphicContainer(
                  child: GestureDetector(
                    child: Icon(Icons.check_rounded, color: Colors.white),
                    onTap: () => {
                      // card add function
                      saveForm(),
                      // new DBHelp.insertDiary(diary);
                    },
                  ),
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
                height: MediaQuery.of(context).size.height * 0.72,
                // 이미지가 있을 때 없을 때
                child: _diary.image != ''
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
                            image: FileImage(File(_diary.image)), // 카드가 될 이미지
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(_diary.title)
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
                  color: _diary.image != '' ? Colors.white : Theme.of(context).highlightColor,
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
                child: Form(
                  key: _form,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
                    child: Column(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 9),
                            // 카드 입력(날짜)
                            InkWell(
                              child: Text(
                                '${_currentDateTime.year}. ${_currentDateTime.month}. ${_currentDateTime.day}.',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).accentColor), textAlign: TextAlign.left,
                              ),
                              onTap: () => _showPicker(), // date picker widget
                            ),

                            SizedBox(height: 5),
                            TextFormField(
                              initialValue : _isEdit? _diary.title: "",
                              inputFormatters: [LengthLimitingTextInputFormatter(40),],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                  hintText: '제목을 입력해 주세요'
                              ),
                              onFieldSubmitted: (_){
                                FocusScope.of(context).requestFocus(_contentFocusNode);
                              },
                              onSaved: (value){
                                _diary.title = value;
                              },
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            initialValue : _isEdit? _diary.contents: "",
                            maxLines: 40,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                hintText: '내용을 입력해 주세요'
                            ),
                            focusNode: _contentFocusNode,
                            onSaved: (value){
                              _diary.contents = value;
                            },
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).accentColor.withOpacity(0.1),
                        ),
                      )
                    ]),
                  ),
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
                  // image 가져오기
                  setState(() {
                    getImage(ImageSource.gallery);
                    _diary.image = this.image_file;
                    print("SDFSDFSDFSD: "+ _diary.image);
                  })
                },
              ),
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
                          'assets/emoji/emoji-2.png',
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