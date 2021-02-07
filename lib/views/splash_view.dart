import 'dart:async';

import 'package:flutter/material.dart';

//import 'package:animated_splash/animated_splash.dart';


class MySplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MySplashScreen();
}

class _MySplashScreen extends State<MySplashScreen>{
  void initState(){
    super.initState();
    Timer(Duration(seconds:5), () => // 첫 페이지 이동 후 연결된 모든 위젯을 트리에서 삭제
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
          )
        ],
      ),
    );
  }
}