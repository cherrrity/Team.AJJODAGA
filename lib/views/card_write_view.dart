import 'dart:convert';
import 'dart:math';
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
  String _emptyImage = "";

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
    setState(() {
      _emptyImage = _initImages();
    });
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
    print("didChange");
    var arg = ModalRoute.of(context).settings.arguments;
    if(arg != null) {
      _diary = arg;
      _isEdit = arg == null? false : true ;  // 수정인지 확인
      _currentDateTime = _isEdit? _diary.dateTime : DateTime.now(); // 수정일 때 수정 날짜로 변경
      _isPhoto = false;
    }
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

  void _showPicker() {
    DatePicker.showDatePicker(
      context,
      locale: DateTimePickerLocale.ko,
      dateFormat: 'yyyy-MM-dd',
      initialDateTime: _currentDateTime,
      minDateTime: DateTime(2000),
      maxDateTime: DateTime.now(),
      onConfirm: (dateTime, List<int> index) {
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

    if(_isEdit){
      // 업데이트하는 경우
      DBHelper().updateDiary(_diary);
    }else{
      // 새로 작성하는 경우
      DBHelper().insertDiary(_diary);
    }

    FocusScopeNode currentFocus = FocusScope.of(context);
    currentFocus.unfocus();
    Navigator.pop(context, true);
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: _height*0.03+ statusBarHeight, bottom: _height*0.03, left: _width *0.05, right : _width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 상단 아이콘 생성
                  NeumorphicContainer(
                    child: GestureDetector(
                      child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size:_width * 0.06),
                      onTap: () => {
                        FocusScope.of(context).unfocus(),
                        Navigator.pop(context)},
                    ),
                    shape: "iconButton",
                  ),
                  NeumorphicContainer(
                    child: GestureDetector(
                      child: Icon(Icons.check_rounded, color: Colors.white, size:_width * 0.06),
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
            Container(
              child:  Center(
                // 메인 카드 앞면
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL, // default
                  front: Container(
                    padding: EdgeInsets.all(_cardHeight*0.02),
                    width: _cardWidth,
                    height: _cardHeight,
                    // 이미지가 있을 때 없을 때
                    child: _diary.image != ''
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
                                image: FileImage(File(_diary.image)), // 카드가 될 이미지
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _cardHeight*0.05,
                          ),
                          _diary.title == '' ? Text("제목을 입력하시면 표시됩니다!", style: TextStyle(fontSize: 18),) :  Text(_diary.title, style: TextStyle(fontSize: 18),)
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
                    width: _cardWidth,
                    height: _cardHeight,
                  child: Form(
                    key: _form,
                    child: Padding(
                      padding: EdgeInsets.all(_cardHeight*0.04),
                      child: Column(
                        children: [
                        Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //SizedBox(height: _cardHeight*0.005),
                                // 카드 입력(날짜)
                                InkWell(
                                  child: Text(
                                    '${_currentDateTime.year}. ${_currentDateTime.month}. ${_currentDateTime.day}.',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).accentColor), textAlign: TextAlign.left,
                                  ),
                                  onTap: () => _showPicker(), // date picker widget
                                ),
                                //SizedBox(height: _cardHeight*0.005),
                                TextFormField(
                                  initialValue : _isEdit? _diary.title: "",
                                  inputFormatters: [LengthLimitingTextInputFormatter(40),],
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
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
                                SizedBox(height: _cardHeight*0.02),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: (_cardHeight - _cardHeight * 0.08) - 85,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              inputFormatters: [LengthLimitingTextInputFormatter(400),],
                              initialValue : _isEdit? _diary.contents: "",
                              maxLines: 16,
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
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeumorphicContainer(
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      iconSize: _width * 0.09,
                      color: Colors.white,
                      onPressed: () => {
                        // image 가져오기
                        setState(() {
                          getImage(ImageSource.gallery);
                          _diary.image = this.image_file;
                        })
                      },
                    ),
                    shape: "add",
                  ),
                  Container(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}