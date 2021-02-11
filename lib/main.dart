import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:package:project_moonhwadiary/name.dart';
import 'package:package:project_moonhwadiary/DBHelp.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_moonhwadiary/photo.dart';
import 'package:project_moonhwadiary/DBHelper.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';


DateTime choice;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter route test',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("main page"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget> [
            ListTile(
              title: Text("옵션"),
            ),
            ListTile(
              title: Text("폰트"),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sort()));
              },
            ),
            ListTile(
              title: Text("테마"),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => backcolor()));
              },
            )],
        ),
      ),
      // body: Expanded(child: child),
      floatingActionButton: FloatingActionButton(
        child: Text("+"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SecondRoute()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  File _image;
  final picker = ImagePicker();
  String pic = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add card"),
      ),
      body: Center(
        child:Column(
            children: <Widget>[
              RaisedButton(
                child: Text("사진추가"),
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
              ),
              showImage(),
              RaisedButton(
                child: Text("글추가"),
                onPressed: () {
                  saveImg();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => writeContexts()));
                },
              ),

              RaisedButton(
                child: Text("완료"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstRoute()));
                },
              ),

            ]
        ),
      ),
    );
  }

  Widget showImage(){
    if(_image == null)
      return Container();
    else
      return Image.file(_image,width:200,height:200);
  }

  Future getImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);

    setState(() {
      if (pickedFile != null) {
        this.pic = pickedFile.path;
        print("selected image_path: $pic");
        _image = File(pickedFile.path);
      }
    });
  }

  DBHelper2 sd2 = DBHelper2();

  Future<void> saveImg() async {

    var fiph = Photo(
      id: Str2sha512(DateTime.now().toString()),
      pic: this.pic,
    );
    await sd2.insertPhoto(fiph);

    print(await sd2.pic());
  }
  String Str2sha512(String text) {
    var bytes = utf8.encode(text);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}



class sort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" 폰트 "),
      ),
      body: Center(

      ),
    );
  }
}

class backcolor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" 테마 "),
      ),
      body: Center(

      ),
    );
  }
}

class writeContexts extends StatefulWidget {
  @override
  _writeContextsState createState() => _writeContextsState();
}

class _writeContextsState extends State<writeContexts> {
  int feel =0;
  DateTime dateTime= DateTime.now();
  String title ="";
  String contents="";

  final myControllerTitle = TextEditingController();
  final myControllerContents = TextEditingController();
  @override
  void dispose(){
    myControllerTitle.dispose();
    myControllerContents.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    myControllerTitle.addListener(_printLatestValue);
    myControllerContents.addListener(_printLatestValue);


  }

  _printLatestValue(){
    print("second text field: ${myControllerTitle.text}");
    print("second text field: ${myControllerContents.text}");


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("write title and contents"),
      ),

      body: Center(
        child: Column(
          children:<Widget> [
            Container(
              child: CupertinoButton(
                  child: Text("날짜 선택"),
                  onPressed: () async{
                    DateTime result = await showCupertinoModalPopup<DateTime>(
                        context: context,
                        builder: (context){
                          return Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 200.0,
                                        color: Colors.white,
                                        child: CupertinoDatePicker(
                                            onDateTimeChanged: (DateTime dt){
                                              choice = dt;
                                            }
                                        )
                                    ),
                                    CupertinoButton(
                                        child: Text("select"),
                                        onPressed: (){
                                          if(choice == null){
                                            choice = DateTime.now();
                                          }
                                          Navigator.of(context).pop(choice);
                                        }
                                    )
                                  ]
                              )
                          );
                        }
                    );
                  }
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '제목',
              ),
              controller:myControllerTitle,
              onChanged: (title) {
                print("title: $title");
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '내용',
              ),
              controller:myControllerContents,
              onChanged: (contents) {
                print("title: $contents");
              },
            ),
            Row(
              children: <Widget> [
                RaisedButton(
                  child: Text('1'),
                  onPressed: (){
                    this.feel = 1;
                    this.dateTime=choice;
                  },
                ),
                RaisedButton(
                  child: Text('2'),
                  onPressed: (){
                    this.feel = 2;
                    this.dateTime=choice;

                  },
                ),
                RaisedButton(
                  child: Text('3'),
                  onPressed: (){
                    this.feel = 3;
                    this.dateTime=choice;

                  },
                ),
                RaisedButton(
                  child: Text('4'),
                  onPressed: (){
                    this.feel = 4;
                    this.dateTime=choice;

                  },
                ),
                RaisedButton(
                    child: Text('5'),
                    onPressed: () {
                      this.feel = 5;
                      this.dateTime=choice;
                    }
                ),
              ],
            ),
            Text('\n'),
            RaisedButton(
              child: Text("완료"),
              onPressed: () => onBtnClick(),

            ),
          ],
        ),
      ),
    );
  }

  void onBtnClick(){
    BuildContext _context;
    setState(
          (){
        this.title = myControllerTitle.text;
        this.contents = myControllerContents.text;
        this.save();
      },
    );
  }


  DBHelper sd = DBHelper();

  Future<void> save() async{
    var fido = Diary(
      title: this.title,
      contents: this.contents,
      feel: this.feel,
      dateTime: this.dateTime,

    );

    await sd.insertDiary(fido);

  }
}
