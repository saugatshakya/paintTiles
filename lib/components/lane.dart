import 'package:flutter/material.dart';

class Lane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black, width: 2)),
    );
  }
}
