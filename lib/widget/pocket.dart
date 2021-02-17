import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_moonhwadiary/main.dart';
import 'package:project_moonhwadiary/models/diary.dart';

import 'package:project_moonhwadiary/widget/theme.dart';

Widget pocket(int year, int month, List<Diary> diaries, BuildContext context){
  List<int> dates = diaries.map((m) => m.dateTime.day).toList();
  List<int> satisfactions = diaries.map((m) => m.feel).toList();

  List<int> datesSet = new List<int>();
  List<List<int>> newList = new List<List<int>>();
  List<List<int>> pocketList = new List<List<int>>();

  for(var i=0; i<dates.length; i++) {
    if(!datesSet.contains(dates[i])) {
      datesSet.add(dates[i]);
    }

    pocketList.add([dates[i], satisfactions[i]]);
  }

  for(var i=0; i<datesSet.length; i++) {
    newList.add([datesSet[i], 0, 0]);
  }

  for(var i=0; i<newList.length; i++) {
    int cnt = 0;
    for(var j=0; j<pocketList.length; j++) {
      if(newList[i][0] == pocketList[j][0]){
        cnt++;
        newList[i][1] += pocketList[j][1];
        newList[i][2] = cnt;
      }
    }
  }

  for(var i=0; i<newList.length; i++) {
    newList[i][1] = newList[i][1] ~/ newList[i][2];
  }

  return GridView.builder(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    itemCount: newList.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 18.0,
    ),
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index) {
      final _date = newList[index][0];
      final _satisfaction = newList[index][1];
      final _cnt = newList[index][2];
      String _currentDateTime;
      return Stack(
        children: [
          // 포켓 뒷 배경
          Center(
            child: Container(
              width: 60,
              height: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).accentColor.withOpacity(0.4),
                    offset: Offset(5.0, 5.0),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Theme.of(context).highlightColor.withOpacity(0.4),
                    offset: Offset(-5.0, -5.0),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                ],
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).cardColor,
                    Theme.of(context).canvasColor
                  ],
                  stops: [0.01, 0.1, 1.0],
                  center: Alignment(0.0, -0.1),
                  radius: 0.7,
                ),
              ),
            ),
          ),
          // 카드
          Center(
              child: (_cnt == 1) ? singleCard()
                  : (_cnt == 2) ? doubleCard()
                  : trioCard()
          ),
          // 포켓 앞 부분 + 날짜
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
                  colors: satColor(_satisfaction, MyApp.of(context).widget.themeController.currentTheme),
                ),
              ),
              child: Center(
                child: Text(
                  '$_date',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
          // 포켓 클릭 시
          GestureDetector(
            onTap: () {
              print('$year, $month, $_date');
              _currentDateTime = DateFormat('yyyy-MM-dd').format(DateTime(year, month, _date));
              Navigator.pushNamed(context, '/card', arguments: '$_currentDateTime');
            },
          ),
        ],
      );
    }
  );
}

List<Color> satColor(int satisfaction, String theme) {
  List<List<Color>> colors;

  switch (theme) {
    case "pink": colors = pinkPocketColors; break;
    case "purple": colors = purplePocketColors; break;
    case "sky": colors = skyPocketColors; break;
    case "mint": colors = mintPocketColors; break;
    case "yellow": colors = yellowPocketColors; break;
    case "olive": colors = olivePocketColors; break;
  }

  if (satisfaction == 1) return colors[0];
  else if (satisfaction == 2) return colors[1];
  else if (satisfaction == 3) return colors[2];
  else if (satisfaction == 4) return colors[3];
  else if (satisfaction == 5) return colors[4];
}

Widget singleCard(){
  return Container(
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
  );
}

Widget doubleCard(){
  return Stack(
    overflow: Overflow.visible,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 6.0, 14.0, 0.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 33,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
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
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 4.0, 0.0, 0.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 33,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
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
      ),
    ],
  );
}

Widget trioCard(){
  return Stack(
    overflow: Overflow.visible,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 13.0, 0.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 33,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
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
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(13.0, 3.0, 0.0, 0.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 33,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
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
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 33,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
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
      ),
    ],
  );
}