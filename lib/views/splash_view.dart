import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:number_slide_animation/number_slide_animation_widget.dart';
import 'package:project_moonhwadiary/DB/DBHelp.dart';
import 'package:speech_bubble/speech_bubble.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _totalDiaryCnt = 0;

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _totalDiaryCnt = await DBHelper().getDiaryNumCnt();
    setState(() {});
  }

  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 5), () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false));
  }

  getCount() async{
    _totalDiaryCnt = await DBHelper().getDiaryNumCnt();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              width: width,
              height: height,
              child: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                body: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _totalDiaryCnt > 0?
                        SpeechBubble(
                          nipLocation: NipLocation.BOTTOM,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                              ),
                              NumberSlideAnimation(
                                number: _totalDiaryCnt.toString(),
                                duration: const Duration(seconds: 1),
                                curve: Curves.bounceIn,
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ): Text(""),
                        SizedBox(height: height*0.02),
                        SvgPicture.asset('assets/icons/019-celebrate.svg', width: width * 0.3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: height* 0.05,
              left: width/2 - 40,
              child: Text("@어쩌다가", style: TextStyle(fontSize: 17, letterSpacing: 0.3, color: Theme.of(context).cardColor, decoration: TextDecoration.none, fontFamily: 'RixTodayCartoon'),)
          )
        ],
      ),
    );
  }
}
