import 'package:flutter/material.dart';
import 'package:project_moonhwadiary/model/model_diary.dart';

Widget pocket(List<Diary> diaries){
  List<int> dates = diaries.map((m) => m.date).toList();
  List<int> satisfactions = diaries.map((m) => m.satisfaction).toList();

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
                  colors: [
                    Color(0xffE68383),
                    Color(0xffFF7272),
                    Color(0xffFEC4C4)
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
                  colors: satColor(_satisfaction),
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
            },
          ),
        ],
      );
    }
  );
}

List<Color> satColor(int satisfaction) {
  if (satisfaction == 1) return [Color(0xffFFE8E8), Color(0xffFFD1D1)];
  else if (satisfaction == 2) return [Color(0xffFDD7D7), Color(0xffFFB2B2)];
  else if (satisfaction == 3) return [Color(0xffFCB0B0), Color(0xffFF9393)];
  else if (satisfaction == 4) return [Color(0xffFB8989), Color(0xffFF6E6E)];
  else if (satisfaction == 5) return [Color(0xffFF7575), Color(0xffF95353)];
}