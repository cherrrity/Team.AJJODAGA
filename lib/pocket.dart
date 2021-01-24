import 'package:flutter/material.dart';
import 'package:project_moonhwadiary/model_diary.dart';

class Pocket extends StatefulWidget {
  final List<Diary> diaries;
  Pocket({this.diaries});

  @override
  _PocketState createState() => _PocketState();
}

class _PocketState extends State<Pocket> {
  List<Diary> diaries;
  List<int> dates;

  @override
  void initState(){
    super.initState();
    diaries = widget.diaries;
    dates = diaries.map((m) => m.date).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      crossAxisCount: 5,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 18.0,
      scrollDirection: Axis.vertical,
      children: List.generate(dates.length, (index) {
        final d = this.dates[index];
        return Stack(
          children: [
            Center(
              child: Container(
                width: 60,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xffFEC4C4),
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffD8A7A7).withOpacity(0.4),
                      offset: Offset(5.0, 5.0),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: const Color(0xffFFE1E1).withOpacity(0.4),
                      offset: Offset(-5.0, -5.0),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  gradient: RadialGradient(
                    colors: [Color(0xffE68383), Color(0xffFF7272), Color(0xffFEC4C4)],
                    stops: [0.01, 0.1, 1.0],
                    center: Alignment(0.0, -0.1),
                    radius: 0.7,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 35,
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 60,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.zero,
                    bottom: Radius.circular(17),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffFDD7D7), Color(0xffFFB2B2)],
                  ),
                ),
                child: Center(
                  child: Text(
                    '$d',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
