import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  Player({this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Icon(
        Icons.airplanemode_on,
        color: color,
        size: 210,
      ),
    );
  }
}
