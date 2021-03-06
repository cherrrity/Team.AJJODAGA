import 'package:flutter/material.dart';
import 'package:project_moonhwadiary/main.dart';
import 'package:project_moonhwadiary/modules/neumorphicContainer.dart';

import 'package:project_moonhwadiary/DB/ThemeController.dart';

enum Themes { pink, purple, sky, mint, yellow, olive }

class ThemeColor extends StatefulWidget {
  @override
  _ThemeColorState createState() => _ThemeColorState();
}

class _ThemeColorState extends State<ThemeColor> {
  Themes _themes = Themes.pink;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      switch (MyApp.of(context).widget.themeController.currentTheme) {
        case "pink":
          _themes = Themes.pink;
          break;
        case "purple":
          _themes = Themes.purple;
          break;
        case "sky":
          _themes = Themes.sky;
          break;
        case "mint":
          _themes = Themes.mint;
          break;
        case "yellow":
          _themes = Themes.yellow;
          break;
        case "olive":
          _themes = Themes.olive;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    double _height = MediaQuery.of(context).size.height - (statusBarHeight * 2);
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: statusBarHeight),
        child:  SafeArea(
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
                          child: Icon(Icons.arrow_back_ios_rounded,
                              color: Colors.white, size:_width * 0.06),
                          onTap: () => Navigator.pop(context),
                        ),
                        shape: "iconButton",
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '테마',
                        style: TextStyle(
                          color: const Color(0xff393939),
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 30.0, 5.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      RadioListTile(
                        title: Text(
                          '분홍',
                          style: TextStyle(
                              color: const Color(0xff393939), fontSize: 18.0),
                        ),
                        value: Themes.pink,
                        groupValue: _themes,
                        activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setTheme('pink');
                            _themes = value;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          '보라',
                          style: TextStyle(
                              color: const Color(0xff393939), fontSize: 18.0),
                        ),
                        value: Themes.purple,
                        groupValue: _themes,
                        activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setTheme('purple');
                            _themes = value;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          '하늘',
                          style: TextStyle(
                              color: const Color(0xff393939), fontSize: 18.0),
                        ),
                        value: Themes.sky,
                        groupValue: _themes,
                        activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setTheme('sky');
                            _themes = value;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          '민트',
                          style: TextStyle(
                              color: const Color(0xff393939), fontSize: 18.0),
                        ),
                        value: Themes.mint,
                        groupValue: _themes,
                        activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setTheme('mint');
                            _themes = value;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          '노랑',
                          style: TextStyle(
                              color: const Color(0xff393939), fontSize: 18.0),
                        ),
                        value: Themes.yellow,
                        groupValue: _themes,
                        activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setTheme('yellow');
                            _themes = value;

                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          '올리브',
                          style: TextStyle(
                              color: const Color(0xff393939), fontSize: 18.0),
                        ),
                        value: Themes.olive,
                        groupValue: _themes,
                        activeColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (value) {
                          setState(() {
                            ThemeController.of(context).setTheme('olive');
                            _themes = value;
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
