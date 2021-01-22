import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:project_moonhwadiary/name.dart';
import 'package:project_moonhwadiary/DBHelp.dart';
DateTime _selectedDate;

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
      body: Center(
        child: Text('hi'),
      ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => addText()));
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
        _image = File(pickedFile.path);
      } else {
        print('기본 이미지');
      }
    });
  }
}

class addText extends StatelessWidget {
  int feel =0;
  String year='';
  String month='';
  String day='';
  BuildContext _context;
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
              child: Text('날짜 추가'),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => minidate()));

              },
            ),
            Text('$_selectedDate', style: TextStyle(fontSize: 15),),
            RaisedButton(
              child: Text('내용 추가'),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => writeContexts()));

              },
            ),

            // TextField(decoration: InputDecoration(
            //   labelText: '제목',
            // ),
            // ),
            // TextField(decoration: InputDecoration(
            //   labelText: '내용',
            // ),
            // ),
            Text('\n'),
            Row(
              children: <Widget> [
                RaisedButton(
                  child: Text('1'),
                  onPressed: (){
                    this.feel = 1;
                    this.year=_selectedDate.year.toString();
                    this.month=_selectedDate.month.toString();
                    this.day=_selectedDate.day.toString();
                  },
                ),
                RaisedButton(
                  child: Text('2'),
                  onPressed: (){
                    this.feel = 2;
                    this.year=_selectedDate.year.toString();
                    this.month=_selectedDate.month.toString();
                    this.day=_selectedDate.day.toString();
                  },
                ),
                RaisedButton(
                  child: Text('3'),
                  onPressed: (){
                    this.feel = 3;
                    this.year=_selectedDate.year.toString();
                    this.month=_selectedDate.month.toString();
                    this.day=_selectedDate.day.toString();
                  },
                ),
                RaisedButton(
                  child: Text('4'),
                  onPressed: (){
                    this.feel = 4;
                    this.year=_selectedDate.year.toString();
                    this.month=_selectedDate.month.toString();
                    this.day=_selectedDate.day.toString();
                  },
                ),
                RaisedButton(
                    child: Text('5'),
                    onPressed: () {
                      this.feel = 5;
                      this.year = _selectedDate.year.toString();
                      this.month = _selectedDate.month.toString();
                      this.day = _selectedDate.day.toString();
                    }
                ),
              ],
            ),
            Text('\n'),
            RaisedButton(
              child: Text("완료"),
              onPressed: save,
            ),
          ],
        ),

      ),
    );

  }
  DBHelper sd = DBHelper();

  Future<void> save() async{
    var fido = Diary(
      feel: this.feel,
      year: this.year,
      month: this.month,
      day: this.day,
    );
    await sd.insertDiary(fido);

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
    );

    await sd.insertDiary(fido);

  }
}


class minidate extends StatefulWidget {
  @override
  _minidateState createState() => _minidateState();
}

class _minidateState extends State<minidate> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add date"),
      ),
      body: Center(
        child: Column(
          children:<Widget> [
            RaisedButton(
              onPressed: () {
                Future<DateTime> selected = showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2016),
                  lastDate: DateTime(2026),
                );

                selected.then((dateTime) {
                  setState(() {
                    _selectedDate = dateTime;

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => addText()));
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }

}
