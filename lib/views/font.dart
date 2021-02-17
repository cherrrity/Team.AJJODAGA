import 'package:flutter/material.dart';
import 'package:project_moonhwadiary/DB/ThemeController.dart';
import 'package:project_moonhwadiary/main.dart';
import 'package:project_moonhwadiary/modules/neumorphicContainer.dart';

enum Fonts { nanumGothic, nanumDaheong, bazzi, cafe24, soojin, nanumBareunhiphi, nanumFighting, LocusSangsang, RixTodayCartoon, UNGothicUni, NeoDungenmoPro }

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
        case "NanumDaheong" : _fonts = Fonts.nanumDaheong; break;
        case "Bazzi" : _fonts = Fonts.bazzi; break;
        case "Cafe24" : _fonts = Fonts.cafe24; break;
        case "Soojin" : _fonts = Fonts.soojin; break;
        case "NanumBareunhiphi" : _fonts = Fonts.nanumBareunhiphi; break;
        case "LocusSangsang" : _fonts = Fonts.LocusSangsang; break;
        case "RixTodayCartoon" : _fonts = Fonts.RixTodayCartoon; break;
        case "UNGothicUni" : _fonts = Fonts.UNGothicUni; break;
        case "NeoDungenmoPro" : _fonts = Fonts.NeoDungenmoPro; break;
      }
    });
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

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                //padding: const EdgeInsets.only(top: 20.0),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      child: NeumorphicContainer(
                        child: GestureDetector(
                          child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size: _width * 0.06),
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
                  child: ListView(
                    children: <Widget>[
                      RadioListTile(title: Text('나눔 고딕', style: TextStyle(color: const Color(0xff393939), fontSize: 18.0, fontFamily: 'NanumGothic'),),
                        value: Fonts.nanumGothic, groupValue: _fonts, activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setFont('NanumGothic');
                            _fonts = value;
                            MyApp.of(context).fontName = "NanumGothic";
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
                            MyApp.of(context).fontName = "NanumDaheong";
                          });
                        },
                      ),
                      RadioListTile(title: Text('배찌', style: TextStyle(color: const Color(0xff393939), fontSize: 18.0, fontFamily: 'Bazzi'),),
                        value: Fonts.bazzi, groupValue: _fonts, activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setFont('Bazzi');
                            _fonts = value;
                            MyApp.of(context).fontName = "Bazzi";
                          });
                        },
                      ),
                      RadioListTile(title: Text('카페24', style: TextStyle(color: const Color(0xff393939), fontSize: 18.0, fontFamily: 'Cafe24'),),
                        value: Fonts.cafe24, groupValue: _fonts, activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setFont('Cafe24');
                            _fonts = value;
                            MyApp.of(context).fontName = "Cafe24";
                          });
                        },
                      ),
                      RadioListTile(title: Text('수진', style: TextStyle(color: const Color(0xff393939), fontSize: 18.0, fontFamily: 'Soojin'),),
                        value: Fonts.soojin, groupValue: _fonts, activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setFont('Soojin');
                            _fonts = value;
                            MyApp.of(context).fontName = "Soojin";
                          });
                        },
                      ),
                      RadioListTile(title: Text('나눔손글씨 바른히피체', style: TextStyle(color: const Color(0xff393939), fontSize: 20.0, fontFamily: 'NanumBareunhiphi'),),
                        value: Fonts.nanumBareunhiphi, groupValue: _fonts, activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setFont('NanumBareunhiphi');
                            _fonts = value;
                            MyApp.of(context).fontName = "NanumBareunhiphi";
                          });
                        },
                      ),
                      RadioListTile(title: Text('나눔손글씨 응원한마디', style: TextStyle(color: const Color(0xff393939), fontSize: 20.0, fontFamily: 'NanumFighting'),),
                        value: Fonts.nanumFighting, groupValue: _fonts, activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setFont('NanumFighting');
                            _fonts = value;
                            MyApp.of(context).fontName = "NanumFighting";
                          });
                        },
                      ),
                      RadioListTile(title: Text('상상체', style: TextStyle(color: const Color(0xff393939), fontSize: 20.0, fontFamily: 'LocusSangsang'),),
                        value: Fonts.LocusSangsang, groupValue: _fonts, activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setFont('LocusSangsang');
                            _fonts = value;
                            MyApp.of(context).fontName = "LocusSangsang";
                          });
                        },
                      ),
                      RadioListTile(title: Text('Rix 오늘의 만화', style: TextStyle(color: const Color(0xff393939), fontSize: 20.0, fontFamily: 'RixTodayCartoon'),),
                        value: Fonts.RixTodayCartoon, groupValue: _fonts, activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setFont('RixTodayCartoon');
                            _fonts = value;
                            MyApp.of(context).fontName = "RixTodayCartoon";
                          });
                        },
                      ),
                      RadioListTile(title: Text('고딕UNi', style: TextStyle(color: const Color(0xff393939), fontSize: 20.0, fontFamily: 'UNGothicUni'),),
                        value: Fonts.nanumFighting, groupValue: _fonts, activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setFont('UNGothicUni');
                            _fonts = value;
                            MyApp.of(context).fontName = "UNGothicUni";
                          });
                        },
                      ),
                      RadioListTile(title: Text('네오 둥근모Pro', style: TextStyle(color: const Color(0xff393939), fontSize: 20.0, fontFamily: 'NeoDungenmoPro'),),
                        value: Fonts.NeoDungenmoPro, groupValue: _fonts, activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setFont('NeoDungenmoPro');
                            _fonts = value;
                            MyApp.of(context).fontName = "NeoDungenmoPro";
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
      ),
    );
  }
}