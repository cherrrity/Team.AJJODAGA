import 'package:flutter/material.dart';
import 'package:project_moonhwadiary/DB/ThemeController.dart';
import 'package:project_moonhwadiary/main.dart';
import 'package:project_moonhwadiary/views/neumorphicContainer.dart';

enum Fonts { nanumGothic, nanumSehwa, nanumDaheong }

class Font extends StatefulWidget {
  // const Font({Key key}) : super(key: key);

  @override
  FontState createState() => FontState();
}

class FontState extends State<Font> {
  Fonts _fonts = Fonts.nanumGothic;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      switch(MyApp.of(context).widget.themeController.currentFont){
        case "NanumGothic" : _fonts = Fonts.nanumGothic; break;
        case "NanumSehwa" : _fonts = Fonts.nanumSehwa; break;
        case "NanumDaheong" : _fonts = Fonts.nanumDaheong; break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: NeumorphicContainer(
                      child: GestureDetector(
                        child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                        onTap: () =>  Navigator.pop(context),
                      ),
                      shape: "iconButton",
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text('폰트',
                      style: TextStyle(
                        color: const Color(0xff393939),
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Text('0123456789\n개구리는 개굴개굴\n병아리는 삐약삐약',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ),
            Divider(
              indent: 20.0,
              endIndent: 20.0,
              color: Colors.white,
              thickness: 0.5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 0.0),
                child: Column(
                  children: <Widget>[
                    RadioListTile(title: Text('나눔 고딕', style: TextStyle(color: const Color(0xff393939), fontSize: 18.0, fontFamily: 'NanumGothic'),),
                      value: Fonts.nanumGothic, groupValue: _fonts, activeColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (value) {
                        setState(() {
                          ThemeController.of(context).setFont('NanumGothic');
                          _fonts = value;
                          print('고딕');
                          MyApp.of(context).fontName = "NanumGothic";
                        });
                      },
                    ),
                    RadioListTile(title: Text('나눔손글씨 세화체', style: TextStyle(color: const Color(0xff393939), fontSize: 24.0, fontFamily: 'NanumSehwa'),),
                      value: Fonts.nanumSehwa, groupValue: _fonts, activeColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (value) {
                        setState(() {
                          ThemeController.of(context).setFont('NanumSehwa');
                          _fonts = value;
                          print('세화');
                          MyApp.of(context).fontName = "NanumSehwa";
                        });
                      },
                    ),
                    RadioListTile(title: Text('나눔손글씨 다행체', style: TextStyle(color: const Color(0xff393939), fontSize: 20.0, fontFamily: 'NanumDaheong'),),
                      value: Fonts.nanumDaheong, groupValue: _fonts, activeColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (value) {
                        setState(() {
                          ThemeController.of(context).setFont('NanumDaheong');
                          _fonts = value;
                          print('다행');
                          MyApp.of(context).fontName = "NanumDaheong";
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}