import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:paint_tiles/components/block.dart';
import 'package:paint_tiles/components/lane.dart';
import 'package:paint_tiles/components/player.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<Color> color = [Colors.red, Colors.blue, Colors.green, Colors.yellow];
  int i = 0;
  getrandom(max) {
    return Random().nextInt(max);
  }

  checkOut(pos) {
    if (pos > 800) {
      return true;
    }
    return false;
  }

  double lane = 0;
  double b1pos;
  int b1color = Random().nextInt(4);
  int b1lane = Random().nextInt(2);
  double b2pos;
  int b2color = Random().nextInt(4);
  int b2lane = Random().nextInt(2);
  int point = 0;
  double acc;
  bool playing = false;
  chkpoint() {
    if (lane == b1lane && b1pos > 400 && b1pos < 800 && b1color == i) {
      setState(() {
        b1pos = -200;
        b1color = Random().nextInt(4);
        b1lane = Random().nextInt(2);
        point++;
      });
    }
    if (lane == b2lane && b2pos > 400 && b2pos < 800 && b2color == i) {
      setState(() {
        b2pos = -200;
        b2color = Random().nextInt(4);
        b2lane = Random().nextInt(2);
        point++;
      });
    }
  }

  startGame() {
    playing = true;
    setState(() {
      b1pos = 0;
      b2pos = -350;
      acc = 4;
      b1color = Random().nextInt(4);
      b1lane = Random().nextInt(2);
      b2color = Random().nextInt(4);
      b2lane = Random().nextInt(2);
      point = 0;
    });
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      chkpoint();
      if (checkOut(b1pos) || checkOut(b2pos)) {
        timer.cancel();
        playing = false;
      }
      setState(() {
        b1pos += acc;
        b2pos += acc;
      });
      acc += 0.01;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[300],
      child: Stack(children: [
        Positioned(
          top: b1pos,
          left: b1lane == 0 ? 0 : MediaQuery.of(context).size.width * 0.5,
          child: Block(
            color: color[b1color],
          ),
        ),
        Positioned(
          top: b2pos,
          left: b2lane == 0 ? 0 : MediaQuery.of(context).size.width * 0.5,
          child: Block(color: color[b2color]),
        ),
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    lane = 0;
                  });
                },
                child: Lane()),
            GestureDetector(
                onTap: () {
                  setState(() {
                    lane = 1;
                  });
                },
                child: Lane())
          ],
        ),
        Positioned(
            bottom: 0,
            left: lane == 0 ? 0 : MediaQuery.of(context).size.width * 0.5,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    i++;
                    i == 4 ? i = 0 : i = i;
                  });
                },
                child: Player(color: color[i]))),
        playing
            ? Container()
            : Center(
                child: Material(
                    child: GestureDetector(
                onTap: () {
                  startGame();
                },
                child: Text(
                  "Tap to play",
                  style: TextStyle(fontSize: 55),
                ),
              ))),
        Positioned(
            top: 20,
            left: MediaQuery.of(context).size.width * 0.25,
            child: Material(
                color: Colors.white,
                child: Text(
                  "Score: " + point.toString(),
                  style: TextStyle(fontSize: 53),
                ))),
      ]),
    );
  }
}
