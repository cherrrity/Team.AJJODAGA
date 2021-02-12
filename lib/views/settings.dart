import 'package:flutter/material.dart';
import 'package:project_moonhwadiary/views/font.dart';
// import 'package:project_moonhwadiary/views/neumorphicContainer.dart';
import 'package:project_moonhwadiary/modules/NeumorphicContainer.dart';
import 'package:project_moonhwadiary/views/theme.dart';

import 'package:project_moonhwadiary/DB/ThemeController.dart';

class Settings extends StatelessWidget {
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
                        child: Icon(Icons.arrow_back_ios_rounded,
                            color: Colors.white),
                        onTap: () => Navigator.pop(context),
                      ),
                      shape: "iconButton",
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      '설정',
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
              child: ListView(
                padding: EdgeInsets.fromLTRB(12.0, 30.0, 12.0, 0.0),
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.font_download,
                      color: Colors.white,
                    ),
                    title: Text(
                      '폰트',
                      style: TextStyle(
                          color: const Color(0xff393939), fontSize: 18.0),
                    ),
                    trailing: NeumorphicContainer(
                      child: GestureDetector(
                        child: Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.white),
                        onTap: () =>
                            Navigator.pushNamed(context, '/setting_font'),
                      ),
                      shape: "iconButton",
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.color_lens,
                      color: Colors.white,
                    ),
                    title: Text(
                      '테마',
                      style: TextStyle(
                          color: const Color(0xff393939), fontSize: 18.0),
                    ),
                    trailing: NeumorphicContainer(
                      child: GestureDetector(
                        child: Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.white),
                        onTap: () =>
                            Navigator.pushNamed(context, '/setting_theme'),
                      ),
                      shape: "iconButton",
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      '버전 1.0.0',
                      style: TextStyle(
                          color: const Color(0xff393939), fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
