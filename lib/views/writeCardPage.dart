import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

import 'package:project_moonhwadiary/views/neumorphicContainer.dart';

class WriteCardPage extends StatefulWidget {
  @override
  _WriteCardPage createState() => _WriteCardPage();
}

class _WriteCardPage extends State<WriteCardPage> {
  bool _isPhoto = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xffFFDBDB),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom:30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 상단 아이콘 생성
                NeumorphicContainer(
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                    onTap: () => {
                      print("back")
                    },
                  ),
                  color: Color(0xFFFEC4C4),
                  shape: "iconButton",
                ),
                NeumorphicContainer(
                  child: GestureDetector(
                    child: Icon(Icons.check_rounded, color: Colors.white),
                    onTap: () => {
                      print("back")
                    },
                  ),
                  color: Color(0xFFFEC4C4),
                  shape: "iconButton",
                ),
              ],
            ),
          ),
          
          Center(
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL, // default
              front: Container(
                width: MediaQuery.of(context).size.width * 0.92,
                height : MediaQuery.of(context).size.height * 0.72,
                child: Text("Front", textAlign: TextAlign.center,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow:[
                    BoxShadow(
                      color : Colors.grey,
                    ),
                  ],
                ),
              ),
              back: Container(
                width: MediaQuery.of(context).size.width * 0.92,
                height : MediaQuery.of(context).size.height * 0.72,
                child: Text("Back", textAlign: TextAlign.center,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow:[
                    BoxShadow(
                      color : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            left : 10,
            bottom : 25,
            child: NeumorphicContainer(
              child: IconButton(
                icon: Icon(Icons.add_rounded),
                iconSize: 40,
                color: Colors.white,
                onPressed: () => {
                  print("back")
                },
              ),
              color: Color(0xFFFEC4C4),
              shape: "add",
            ),
          ),
          Positioned(
            right: 40,
            bottom: 40,
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.grey, size: 30,),
                  Icon(Icons.add, color: Colors.grey, size: 30,),
                  Icon(Icons.add, color: Colors.grey, size: 30,),
                  Icon(Icons.add, color: Colors.grey, size: 30,),
                  Icon(Icons.add, color: Colors.grey, size: 30,),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xfffafafa),
              ),
            )
          )
        ],
      ),
      // startdocked
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}