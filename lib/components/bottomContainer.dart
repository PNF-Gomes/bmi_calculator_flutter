import 'package:flutter/material.dart';
import '../constant.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({this.text});

  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Center(child: Text(text, style: kStyleText,)),
      color: kBottomContainer,
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: kBotomContainerHigh,
    );
  }
}