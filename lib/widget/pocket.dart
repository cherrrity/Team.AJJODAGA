import 'package:flutter/material.dart';
import 'package:project_moonhwadiary/main.dart';
import 'package:project_moonhwadiary/models/diary.dart';

import 'package:project_moonhwadiary/widget/theme.dart';

Widget pocket(List<Diary> diaries, BuildContext context){
  List<int> dates = diaries.map((m) => m.dateTime.day).toList();
  List<int> satisfactions = diaries.map((m) => m.feel).toList();

  return GridView.builder(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    itemCount: dates.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 18.0,
    ),
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index) {
      final _date = dates[index];
      final _satisfaction = satisfactions[index];
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
                    color: Theme.of(context).backgroundColor.withOpacity(0.4),
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
              print('$_date');
              // 년 월 일로 넘겨야 검색하기 편할 것 같아요
              Navigator.pushNamed(context, '/card', arguments: '$_date');
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