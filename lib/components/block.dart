import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  Block({this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      height: MediaQuery.of(context).size.width * 0.48,
      width: MediaQuery.of(context).size.width * 0.48,
      color: color,
    );
  }
}
